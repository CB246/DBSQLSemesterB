using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBConnection
/// </summary>
public class DBConnection
{
    private static SqlConnection KGConnection;
    private static String connString = "Data Source=(LocalDB)\\MSSQLLocalDB;" +
        "AttachDbFilename=\"C:\\Program Files\\Microsoft SQL Server\\MSSQL13.SQLEXPRESS" +
        "\\MSSQL\\DATA\\KindergardenSolution.mdf\";Integrated Security=True;Connect Timeout=30";

    private static DBConnection instance = null;

    public static DBConnection getInstance()
    {
        if (instance == null)
            instance = new DBConnection();
        //check();
        return instance;
    }

    private DBConnection()
    {
        KGConnection = new SqlConnection(connString);
    }

    public static void check()
    {
        SqlCommand comm = new SqlCommand();
        comm.CommandText = "query11";
        System.Diagnostics.Debug.WriteLine("Trying to connect DEBUG");
        comm.CommandType = System.Data.CommandType.StoredProcedure;
        comm.Connection = KGConnection;
        comm.Parameters.AddWithValue("@kgID", 13);
        //comm.Parameters.AddWithValue("@classID", 1);
        try
        {
            KGConnection.Open();
            System.Data.DataTable toReturn = new System.Data.DataTable();
            SqlDataAdapter da = new SqlDataAdapter(comm);
            System.Diagnostics.Debug.WriteLine("Returned #" + da.Fill(toReturn));
        } catch (Exception)
        {
            System.Diagnostics.Debug.WriteLine("Exeption occured DEBUG");
        } finally
        {
            KGConnection.Close();
        }
    }
}