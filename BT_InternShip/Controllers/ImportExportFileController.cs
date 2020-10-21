﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using BT_InternShip.Models.Interface;
using Newtonsoft.Json;

namespace BT_InternShip.Controllers
{
    public class ImportExportFileController : Controller
    {
        // GET: ImportExportFile
        public ActionResult Index()
        {
            Customer cus = new Customer();
            Dictionary<string, string> content = cus.Import("D:\\Internship\\BT_InternShip\\BT_InternShip\\Service\\template_import.txt");
            Dictionary<string, string> items = new Dictionary<string, string>();
            using (StreamReader r = new StreamReader("D:\\Internship\\BT_InternShip\\BT_InternShip\\Service\\json.json"))
            {
                string json = r.ReadToEnd();
                items = JsonConvert.DeserializeObject<Dictionary<string, string>>(json); ;
            }
            Dictionary<string, string> dict = new Dictionary<string, string>();
            foreach(KeyValuePair<string, string> item_json in items)
            {
                foreach (KeyValuePair<string, string> item_txt in content)
                {
                    if(item_json.Value == item_txt.Key)
                    {
                        dict.Add(item_json.Key, item_txt.Value);
                    }
                }
            }
            foreach(KeyValuePair<string, string> item in dict)
            {
                ViewBag.showDict += "{ key: " + item.Key + " value: " + item.Value + " }";
            }
            return View(content.ToList());
        }
    }
}