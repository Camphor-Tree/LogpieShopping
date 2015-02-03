// Copyright 2015 logpie.com. All rights reserved.
package com.logpie.shopping.management.storage;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.logpie.shopping.management.util.CollectionUtils;

/**
 * The base DAO to handle the logic of query/insert/update/delete operations
 * 
 * @author zhoyilei
 */
public class LogpieBaseDAO<T>
{
    private static final Logger LOG = Logger.getLogger(LogpieBaseDAO.class);
    private static final String sBaseQuerySQL = "select * from ";
    private static final String sBaseInsertSQL = "insert into ";

    public LogpieBaseDAO()
    {
    }

    /**
     * Insert data into the database
     * 
     * @return
     */
    public boolean insertData(final LogpieDataInsert<T> dataInsert)
    {
        final JdbcTemplate jdbcTemplate = LogpieDataSourceFactory.getJdbcTemplate();
        final String insertSQL = buildInsertSQL(dataInsert);
        LOG.debug("insert sql is:" + insertSQL);
        try
        {
            jdbcTemplate.execute(insertSQL);
            return true;
        } catch (Exception e)
        {
            LOG.error("Error happened when inserting the data", e);
        }
        return false;
    }

    /**
     * Query result from database
     * 
     * @param query
     * @return
     */
    public List<T> queryResult(final LogpieDataQuery<T> query)
    {
        final JdbcTemplate jdbcTemplate = LogpieDataSourceFactory.getJdbcTemplate();
        final RowMapper<T> resultMapper = query.getQueryResultMapper();
        final Set<String> queryConditions = query.getQueryConditions();
        final Map<String, String> queryTables = query.getQueryTables();

        if (queryTables == null || queryTables.size() == 0)
        {
            throw new IllegalArgumentException("The query talbe cannot be null or empty");
        }
        final String queryTablesSql = buildQueryTablesSQL(queryTables);
        final String querySQL = buildQuerySQL(queryConditions, queryTablesSql);
        LOG.debug("querySQL is:" + querySQL);
        final List<T> results = jdbcTemplate.query(querySQL, resultMapper);
        return results;
    }

    /**
     * @param queryConditions
     * @param queryTablesSql
     * @return
     */
    private String buildQuerySQL(final Set<String> queryConditions, final String queryTablesSql)
    {
        String querySQL;
        if (!CollectionUtils.isEmpty(queryConditions))
        {
            final String queryConditionSql = buildQueryConditionsSQL(queryConditions);
            querySQL = sBaseQuerySQL + queryTablesSql + queryConditionSql;
        }
        else
        {
            querySQL = sBaseQuerySQL + queryTablesSql;
        }
        return querySQL;
    }

    /**
     * @param queryTables
     */
    private String buildQueryTablesSQL(final Map<String, String> queryTables)
    {
        final StringBuilder queryTablesBuilder = new StringBuilder();
        final int countTables = queryTables.size();
        int i = 0;
        for (final Map.Entry<String, String> tableEntry : queryTables.entrySet())
        {
            queryTablesBuilder.append(tableEntry.getKey());
            // Append table name alias, which is used in multiple foreign keys
            // connections
            if (tableEntry.getValue() != null)
            {
                queryTablesBuilder.append(" AS ");
                queryTablesBuilder.append(tableEntry.getValue());
            }
            if (++i < countTables)
            {
                queryTablesBuilder.append(",");
            }
            else
            {
                queryTablesBuilder.append(" ");
            }
        }
        return queryTablesBuilder.toString();
    }

    /**
     * @param queryConditions
     */
    private String buildQueryConditionsSQL(final Set<String> queryConditions)
    {
        final StringBuilder queryConditionBuilder = new StringBuilder("where ");
        final int countTables = queryConditions.size();
        int i = 0;
        for (final String condition : queryConditions)
        {
            queryConditionBuilder.append(condition);
            if (++i < countTables)
            {
                queryConditionBuilder.append(" AND ");
            }
            else
            {
                queryConditionBuilder.append(" ");
            }
        }
        return queryConditionBuilder.toString();
    }

    private String buildInsertSQL(final LogpieDataInsert<T> dataInsert)
    {
        final StringBuilder insertSqlBuilder = new StringBuilder(sBaseInsertSQL);
        final String table = dataInsert.getInsertTable();
        final Map<String, Object> dataMap = dataInsert.getInsertValues();
        // append the table name
        insertSqlBuilder.append(table);

        final StringBuilder keyBuilder = new StringBuilder(" (");
        final StringBuilder valueBuilder = new StringBuilder(" values (");
        int i = 0;
        int size = dataMap.size();
        for (Map.Entry<String, Object> dataEntry : dataMap.entrySet())
        {
            final String key = dataEntry.getKey();
            final Object value = dataEntry.getValue();
            keyBuilder.append(key);
            if (++i < size)
            {
                // If not last element, append ","
                keyBuilder.append(",");
            }

            if (value instanceof String)
            {
                valueBuilder.append("\'");
                valueBuilder.append(value);
                valueBuilder.append("\'");
            }
            else
            {
                valueBuilder.append(String.valueOf(value));
            }

            // If not last element, append ","
            if (i < size)
            {
                valueBuilder.append(",");
            }

        }
        keyBuilder.append(")");
        valueBuilder.append(")");

        // append the keys and values sql statement
        insertSqlBuilder.append(keyBuilder.toString());
        insertSqlBuilder.append(valueBuilder.toString());
        return insertSqlBuilder.toString();
    }
}
