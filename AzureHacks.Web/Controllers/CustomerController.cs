using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AzureHacks.Web.ViewModels;
using Microsoft.WindowsAzure;
using AzureStorage.Storage;
using AzureHacks.Domain.Commands;
using AzureHacks.Domain.Models;

namespace AzureHacks.Web.Controllers
{
    public class CustomerController : Controller
    {
        CloudStorageAccount account;
        public CustomerController()
        {
            account = CloudStorageAccount.FromConfigurationSetting("DataConnectionString");
        }

        public ActionResult Index()
        {
            AzureTable<Customer> table = new AzureTable<Customer>(account);
            var customers = table.Query;
            if (Request.IsAjaxRequest())
            {
                return PartialView("_List", customers);
            }
            return View(customers);
        }
        public ViewResult Create()
        {
            var viewModel = new CustomerFormModel();
            return View(viewModel);
        }
        [HttpPost]
        public ActionResult Create(CustomerFormModel formModel)
        {
        if (ModelState.IsValid)
        {
            AzureQueue<NewCustomerCommand> queue = new 
                                AzureQueue<NewCustomerCommand>(account);
            queue.AddMessage(new NewCustomerCommand
            {
                FirstName = formModel.FirstName,
                LastName = formModel.LastName,
                Address = formModel.Address,
                Phone = formModel.Phone,
                Email = formModel.Email
            });              
          return RedirectToAction("Index");
        }
         return View(formModel);
        }
    }
}
