using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BT_InternShip.Models
{
    public class CustomerObj
    {
        private string v1;
        private string v2;

        public CustomerObj(string v1, string v2)
        {
            this.v1 = v1;
            this.v2 = v2;
        }

        public string PurchGroup { get; set; }
        public string PurchasingDocument { get; set; }
        //public string Vendor {get; set;}
        //public string SupplyingPlant { get; set; }
        //public DateTime DocDate {get; set;}
        //public string YourReference { get; set; }
        //public string PurchOrg { get; set; }
        //public string PurchGroup1 { get; set; }
        //public string CompanyCode { get; set; }
        //public int Item { get; set; }
        //public string AccountAssignmentCat {get; set;}
        //public string ItemCat { get; set; }
        //public string Material{ get; set; }
        //public string ShortText { get; set; }
        //public Decimal POQuantity{ get; set; }
        //public string OUN{ get; set; }
        //public string DateCat { get; set; }
        //public DateTime DelivDate{ get; set; }
        //public Decimal NetPrice { get; set; }
        //public string Currency{ get; set; }
        //public int Per { get; set; }
        //public string OPU { get; set; }
        //public string Materialgroup { get; set; }
        //public string Plant { get; set; }
        //public string Storlocation { get; set; }
        //public int InfoRec{ get; set; }
        //public DateTime PriceDate{ get; set; }
        //public int PurchaseReq{ get; set; }
        //public int ItemPR { get; set; }
        //public int Line { get; set; }
        //public string ShorttextDetail {get; set;}
        //public int QuantitywithSign { get; set; }
        //public string BaseUnitofMeasure {get; set;}
        //public Decimal GrossPrice { get; set; }
        //public string CurrencyKey { get; set; }
        //public Decimal Amount{ get; set; }
        //public string GLAcct { get; set; }
        //public string BusA{ get; set; }
        //public string CostCtr { get; set; }
        //public string Order{ get; set; }
        //public string ProfitCenter { get; set; }
        //public string Division{ get; set; }
        //public string MaterialGroup { get; set; }
        //public string Country{ get; set; }
        //public string Divinheader{ get; set; }
        //public string SaleGroup { get; set; }
        //public decimal Rate{ get; set; }
        //public string Rateunit { get; set; }
        //public string Taxcode { get; set; }
        //public string Asset{ get; set; }
    }
}