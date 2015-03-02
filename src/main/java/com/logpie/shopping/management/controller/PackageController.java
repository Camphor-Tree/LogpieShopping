// Copyright 2015 logpie.com. All rights reserved.
package com.logpie.shopping.management.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.logpie.shopping.management.auth.logic.AuthenticationHelper;
import com.logpie.shopping.management.auth.logic.LogpiePageAlertMessage;
import com.logpie.shopping.management.model.LogpiePackage;
import com.logpie.shopping.management.storage.LogpiePackageDAO;

/**
 * @author zhoyilei
 *
 */
@Controller
public class PackageController
{
    private static final Logger LOG = Logger.getLogger(PackageController.class);

    @RequestMapping(value = "/package_management", method = RequestMethod.GET)
    public Object showPackageManagementPage(final HttpServletRequest request,
            final HttpServletResponse httpResponse, final RedirectAttributes redirectAttrs)
    {
        final boolean authSuccess = AuthenticationHelper.handleAuthentication(request);
        if (authSuccess)
        {
            LOG.debug("Authenticate cookie is valid. Going to package management page.");

            final ModelAndView packageManagementPage = new ModelAndView("package_management");
            if (redirectAttrs.containsAttribute(LogpiePageAlertMessage.KEY_ACTION_MESSAGE_SUCCESS))
            {
                final String message = (String) redirectAttrs.getFlashAttributes().get(
                        LogpiePageAlertMessage.KEY_ACTION_MESSAGE_SUCCESS);
                packageManagementPage.addObject(LogpiePageAlertMessage.KEY_ACTION_MESSAGE_SUCCESS,
                        message);
            }
            if (redirectAttrs.containsAttribute(LogpiePageAlertMessage.KEY_ACTION_MESSAGE_FAIL))
            {
                final String message = (String) redirectAttrs.getFlashAttributes().get(
                        LogpiePageAlertMessage.KEY_ACTION_MESSAGE_FAIL);
                packageManagementPage.addObject(LogpiePageAlertMessage.KEY_ACTION_MESSAGE_FAIL,
                        message);
            }
            final LogpiePackageDAO packageDAO = new LogpiePackageDAO();
            final List<LogpiePackage> packageList = packageDAO.getAllPackage();
            packageManagementPage.addObject("packageList", packageList);

            return packageManagementPage;
        }
        return "redirect:/signin";
    }

    /**
     * Show singple package information
     * 
     * @param request
     * @param packageId
     * @return
     */
    @RequestMapping(value = "/package", method = RequestMethod.GET)
    public Object showPackageDetailPage(final HttpServletRequest request,
            @RequestParam("id") String packageId)
    {
        final boolean authSuccess = AuthenticationHelper.handleAuthentication(request);
        if (authSuccess)
        {
            LOG.debug("Authenticate cookie is valid. Going to package page.");
            final ModelAndView packageDetailPage = new ModelAndView("package_detail");
            final LogpiePackageDAO packageDAO = new LogpiePackageDAO();
            final LogpiePackage logpiePackage = packageDAO.getPackageById(packageId);
            if (logpiePackage != null)
            {
                packageDetailPage.addObject("logpiePackage", logpiePackage);
            }
            return packageDetailPage;
        }
        return "redirect:/signin";
    }

    @RequestMapping(value = "/package/create", method = RequestMethod.POST)
    public Object createPackage(final HttpServletRequest request,
            final HttpServletResponse httpResponse, final RedirectAttributes redirectAttrs)
    {
        final boolean authSuccess = AuthenticationHelper.handleAuthentication(request);
        if (authSuccess)
        {
            LOG.debug("Authenticate cookie is valid. Going to create a new logpiePackage.");
            final LogpiePackage newLogpiePackage = LogpiePackage
                    .readNewLogpiePackageFromRequest(request);
            boolean createLogpiePackageSuccess = false;
            if (newLogpiePackage != null)
            {
                final LogpiePackageDAO logpiePackageDAO = new LogpiePackageDAO();
                createLogpiePackageSuccess = logpiePackageDAO.addPackage(newLogpiePackage);
            }

            if (createLogpiePackageSuccess)
            {
                redirectAttrs.addFlashAttribute(LogpiePageAlertMessage.KEY_ACTION_MESSAGE_SUCCESS,
                        "create new logpiePackage to " + newLogpiePackage.getPackageDestination()
                                + " successfully!");
            }
            else
            {
                redirectAttrs.addFlashAttribute(LogpiePageAlertMessage.KEY_ACTION_MESSAGE_FAIL,
                        "create new logpiePackage to " + newLogpiePackage.getPackageDestination()
                                + " fail!");
            }

            return "redirect:/order_management";
        }
        return "redirect:/signin";
    }

    @RequestMapping(value = "/package/edit", method = RequestMethod.GET)
    public Object showModifyPackagePage(final HttpServletRequest request,
            final HttpServletResponse httpResponse, @RequestParam("id") String packageId,
            final RedirectAttributes redirectAttrs)
    {
        final boolean authSuccess = AuthenticationHelper.handleAuthentication(request);
        if (authSuccess)
        {
            final ModelAndView modifyOrderPage = new ModelAndView("package_edit");

            final LogpiePackageDAO packageDAO = new LogpiePackageDAO();
            final LogpiePackage logpiePackage = packageDAO.getPackageById(packageId);
            modifyOrderPage.addObject("logpiePackage", logpiePackage);

            return modifyOrderPage;
        }
        return "redirect:/signin";
    }

    @RequestMapping(value = "/package/edit", method = RequestMethod.POST)
    public Object modifyPackage(final HttpServletRequest request,
            final HttpServletResponse httpResponse, final RedirectAttributes redirectAttrs)
    {
        final boolean authSuccess = AuthenticationHelper.handleAuthentication(request);
        if (authSuccess)
        {
            LOG.debug("Authenticate cookie is valid. Going to modify the package information.");
            final LogpiePackage modifiedPackage = LogpiePackage
                    .readModifiedLogpiePackageFromRequest(request);
            boolean updatePackageSuccess = false;
            if (modifiedPackage != null)
            {
                final LogpiePackageDAO packageDAO = new LogpiePackageDAO();
                updatePackageSuccess = packageDAO.updateLogpiePackageProfile(modifiedPackage);
            }

            if (updatePackageSuccess)
            {
                redirectAttrs.addFlashAttribute(LogpiePageAlertMessage.KEY_ACTION_MESSAGE_SUCCESS,
                        "更新包裹:" + modifiedPackage.getPackageId() + " 信息，成功!");
            }
            else
            {
                redirectAttrs.addFlashAttribute(LogpiePageAlertMessage.KEY_ACTION_MESSAGE_FAIL,
                        "更新包裹:" + modifiedPackage.getPackageId() + " 信息，失败!");
            }
            return "redirect:/package_management";
        }
        return "redirect:/signin";
    }
}
