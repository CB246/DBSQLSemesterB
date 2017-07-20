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

    public static String userLogin = "";
    public static String userPassword = "";

    private KGManager()
    {
        DBConn = DBConnection.getInstance();
    }

    public static void logOut()
    {
        userLogin = "";
        userPassword = "";
    }
}