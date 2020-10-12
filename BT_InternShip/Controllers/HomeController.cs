using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BT_InternShip.Models;

namespace BT_InternShip.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private DBManagementEntities db = new DBManagementEntities();

        // GET: Admin/Admin_Product
        public ActionResult Index()
        {
            var pRODUCTTables = db.PRODUCTTables.ToList();
            return View(pRODUCTTables);
        }

        // GET: Admin/Admin_Product/Details/
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PRODUCTTable pRODUCTTable = db.PRODUCTTables.Find(id);
            if (pRODUCTTable == null)
            {
                return HttpNotFound();
            }
            return View(pRODUCTTable);
        }

        // GET: Admin/Admin_Product/Create
        public ActionResult Create()
        {
            ViewBag.BRAND_ID = new SelectList(db.BRANDTables, "BRAND_ID", "BRAND_NAME");
            ViewBag.CATEGORY_ID = new SelectList(db.CATEGORYTables, "CATEGORY_ID", "CATEGORY_NAME");
            return View();
        }

        // POST: Admin/Admin_Product/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PRODUCT_ID,PRODUCT_CODE,PRODUCT_NAME,PRODUCT_IMAGE,PRODUCT_DESCRIPTION,CATEGORY_ID,BRAND_ID,DATECREATE")] PRODUCTTable pRODUCTTable, HttpPostedFileBase img_Product)
        {
            if (ModelState.IsValid)
            {
                // add product image
                var img = Path.GetFileName(img_Product.FileName);
                var pathimg = Path.Combine(Server.MapPath("~/Content/images/produtcs"), img);
                if (img_Product == null)
                {
                    ViewBag.Img = "Chose image";
                    return View(pRODUCTTable);
                }
                else if (System.IO.File.Exists(pathimg))
                    ViewBag.Img = "Image have Existed";
                else
                    img_Product.SaveAs(pathimg);
                pRODUCTTable.PRODUCT_IMAGE = img_Product.FileName;

                pRODUCTTable.DATECREATE = DateTime.Now;
                db.PRODUCTTables.Add(pRODUCTTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BRAND_ID = new SelectList(db.BRANDTables, "BRAND_ID", "BRAND_NAME", pRODUCTTable.BRAND_ID);
            ViewBag.CATEGORY_ID = new SelectList(db.CATEGORYTables, "CATEGORY_ID", "CATEGORY_NAME", pRODUCTTable.CATEGORY_ID);
            return View(pRODUCTTable);
        }

        // GET: Admin/Admin_Product/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PRODUCTTable pRODUCTTable = db.PRODUCTTables.Find(id);
            if (pRODUCTTable == null)
            {
                return HttpNotFound();
            }
            ViewBag.BRAND_ID = new SelectList(db.BRANDTables, "BRAND_ID", "BRAND_NAME", pRODUCTTable.BRAND_ID);
            ViewBag.CATEGORY_ID = new SelectList(db.CATEGORYTables, "CATEGORY_ID", "CATEGORY_NAME", pRODUCTTable.CATEGORY_ID);
            return View(pRODUCTTable);
        }

        // POST: Admin/Admin_Product/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PRODUCT_ID,PRODUCT_CODE,PRODUCT_NAME,PRODUCT_IMAGE,PRODUCT_DESCRIPTION,CATEGORY_ID,BRAND_ID,DATECREATE")] PRODUCTTable pRODUCTTable, HttpPostedFileBase img_Product)
        {
            if (ModelState.IsValid)
            {
                if (img_Product != null)
                {
                    // xoa anh cu
                    if (pRODUCTTable.PRODUCT_IMAGE != null)
                    {
                        string fullPath = Request.MapPath("~/Content/images/produtcs/" + pRODUCTTable.PRODUCT_IMAGE);
                        System.IO.File.Delete(fullPath);
                    }
                    // them anh dai dien san pham
                    var img = Path.GetFileName(img_Product.FileName);
                    var pathimg = Path.Combine(Server.MapPath("~/Content/images/produtcs"), img);
                    if (img_Product == null)
                    {
                        ViewBag.Img = "Chose image";
                        return View(pRODUCTTable);
                    }
                    else if (System.IO.File.Exists(pathimg))
                        ViewBag.Img = "Image have Exist";
                    else
                        img_Product.SaveAs(pathimg);
                    pRODUCTTable.PRODUCT_IMAGE = img_Product.FileName;
                }

                db.Entry(pRODUCTTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BRAND_ID = new SelectList(db.BRANDTables, "BRAND_ID", "BRAND_NAME", pRODUCTTable.BRAND_ID);
            ViewBag.CATEGORY_ID = new SelectList(db.CATEGORYTables, "CATEGORY_ID", "CATEGORY_NAME", pRODUCTTable.CATEGORY_ID);
            return View(pRODUCTTable);
        }

        // GET: Admin/Admin_Product/Delete/5
        public ActionResult DeleteConfirmed(int? id)
        {
            if (id == null)
            {
                return HttpNotFound();
            }
            PRODUCTTable pRODUCTTable = db.PRODUCTTables.Find(id);
            if (pRODUCTTable == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            db.PRODUCTTables.Remove(pRODUCTTable);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}