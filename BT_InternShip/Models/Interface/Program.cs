using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using ExcelDataReader;
using System.IO;
using BT_InternShip.Models;

namespace BT_InternShip.Models.Interface
{
    interface ICustomer
    {
        Dictionary<string, string> Import(string filePath);
        void Export(string filePath);
    }
    class Customer : ICustomer
    {
        public Dictionary<string, string> Import(string filePath)
        {
            string[] endPath = filePath.Split('.');
            Dictionary<string, string> dict = new Dictionary<string, string>();
            switch (endPath[endPath.Length - 1])
            {
                case "txt":
                    string[] title = getTitle(filePath);
                    int rowCount = File.ReadLines(filePath).ToArray().Length;
                    for(int i = 1;i < rowCount; i++)
                    {
                        for(int j = 0; j < title.Length; j++)
                        {
                            string tmp_value = getValueByRow(filePath, i, j);
                            if(i == 1)
                            {
                                dict.Add(title[j], tmp_value);
                            }
                            else
                            {
                                string tmp_current = null;
                                dict.TryGetValue(title[j], out tmp_current);
                                dict[title[j]] = tmp_current + " ," + tmp_value;
                            }
                        }
                    }
                    break;
                case "xlsx":
                    break;
                case "pdf":
                    break;
                default:
                    Console.WriteLine("Không tìm thấy định dạng");
                    break;
            }
            return dict;
        }
        public void Export(string filePath)
        {

        }

        public string[] getTitle(string filePath)
        {
            string[] title_arr = File.ReadLines(filePath).ToArray();
            string sep = "\t";
            string[] title_split = title_arr[0].Split(sep.ToCharArray()).ToArray();
            for(int i = 0; i < title_split.Length - 1; i++)
            {
                for(int j = i + 1;j < title_split.Length; j++)
                {
                    if(title_split[i] == title_split[j])
                    {
                        title_split[j] += j;
                    }

                }
            }
            return title_split;
        }

        public string getValueByRow(string filePath, int row, int col)
        {
            string[] value_arr = File.ReadLines(filePath).ToArray();
            string sep = "\t";
            string[] value_split = value_arr[row].Split(sep.ToCharArray()).ToArray();
            return value_split[col];
        }
    }
}