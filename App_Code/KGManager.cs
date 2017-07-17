using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ConnManager
/// </summary>
public class KGManager
{
    private static DBConnection DBConn;

    private KGManager()
    {
        DBConn = DBConnection.getInstance();
    }
}