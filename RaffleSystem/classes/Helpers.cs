using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Helpers
/// </summary>
/// 
namespace RAKSOCT_RAFFLE
{
    public static class Helpers
    {
        private static string connstring = ConfigurationManager.ConnectionStrings["conn"].ToString();
        public readonly static int ALL = 0, OLD_ONLY = 1, NEW_ONLY = 2;


        private static int insertNewDrawSet(int NoOfWinners)
        {
            SqlConnection con = new SqlConnection();
            try
            {
                con.ConnectionString = connstring;
                string strQuery = "INSERT INTO DrawSets ([NoOfWinners]) VALUES (@no); SELECT SCOPE_IDENTITY()";
                SqlCommand cmd = new SqlCommand(strQuery, con);
                cmd.Parameters.Add(new SqlParameter("@no", System.Data.SqlDbType.Int)).Value = NoOfWinners;
                con.Open();
                int newSetID = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();

                return newSetID;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }

        private static void insertWinner(int SetID, int ID)
        {
           SqlConnection con = new SqlConnection();
           try
           {
               con.ConnectionString = connstring;
               SqlCommand cmd = new SqlCommand("INSERT INTO Winners ([ID], [SetID]) VALUES (@id, @setid)", con);
               cmd.Parameters.Add(new SqlParameter("@id", System.Data.SqlDbType.Int)).Value = ID;
               cmd.Parameters.Add(new SqlParameter("@setid", System.Data.SqlDbType.Int)).Value = SetID;
               con.Open();
               cmd.ExecuteNonQuery();
               con.Close();
           }
           catch (Exception ex)
           {
               throw ex;
           }
           finally
           {
               if (con.State != System.Data.ConnectionState.Closed)
               {
                   con.Close();
               }
           }
        }


        public static void deleteDrawSet(int SetID)
        {
            SqlConnection con = new SqlConnection();
            try
            {
                con.ConnectionString = connstring;
                SqlCommand cmd1 = new SqlCommand("DELETE FROM Winners WHERE [SetID]=@setid", con);
                cmd1.Parameters.Add(new SqlParameter("@setid", System.Data.SqlDbType.Int)).Value = SetID;

                SqlCommand cmd2 = new SqlCommand("DELETE FROM DrawSets WHERE [SetID]=@setid", con);
                cmd2.Parameters.Add(new SqlParameter("@setid", System.Data.SqlDbType.Int)).Value = SetID;

                con.Open();
                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }

        public static void flushRaffleDB()
        {
            SqlConnection con = new SqlConnection();
            try
            {
                con.ConnectionString = connstring;
                SqlCommand cmd1 = new SqlCommand("DELETE FROM Winners", con);
                SqlCommand cmd2 = new SqlCommand("DELETE FROM DrawSets", con);
                con.Open();
                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }


        public static void insertEmployee(string Employee, bool ForGrandPrize)
        {
            SqlConnection con = new SqlConnection();
            try
            {
                con.ConnectionString = connstring;
                SqlCommand cmd = new SqlCommand("INSERT INTO Employees ([Employee], [ForGrandPrize]) VALUES (@Employee, @ForGrandPrize)", con);
                cmd.Parameters.Add(new SqlParameter("@Employee", System.Data.SqlDbType.NVarChar)).Value = Employee.Trim();
                cmd.Parameters.Add(new SqlParameter("@ForGrandPrize", System.Data.SqlDbType.Bit)).Value = ForGrandPrize;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }


        public static Employee getEmployee(int ID)
        {
            SqlConnection con = new SqlConnection();
            try
            {
                con.ConnectionString = connstring;
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 * FROM Employees WHERE [ID]=@ID", con);
                cmd.Parameters.Add(new SqlParameter("@ID", System.Data.SqlDbType.Int)).Value = ID;

                Employee employee = new Employee();


                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    employee.ID = Convert.ToInt32(dr["ID"]);
                    employee.Name = dr["Employee"].ToString();
                    employee.ForGrandPrize = Convert.ToBoolean(dr["ForGrandPrize"]);
                    dr.Close();
                }
                else
                {
                    employee = null;
                }

                con.Close();

                return employee;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }

        public static void updateEmployee(int ID, string Employee, bool ForGrandPrize)
        {
            SqlConnection con = new SqlConnection();
            try
            {
                con.ConnectionString = connstring;
                SqlCommand cmd = new SqlCommand("UPDATE Employees SET [Employee]=@Employee, [ForGrandPrize]=@ForGrandPrize WHERE [ID]=@ID", con);
                cmd.Parameters.Add(new SqlParameter("@ID", System.Data.SqlDbType.Int)).Value = ID;
                cmd.Parameters.Add(new SqlParameter("@Employee", System.Data.SqlDbType.NVarChar)).Value = Employee.Trim();
                cmd.Parameters.Add(new SqlParameter("@ForGrandPrize", System.Data.SqlDbType.Bit)).Value = ForGrandPrize;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }

        public static void deleteEmployee(int ID)
        {
            SqlConnection con = new SqlConnection();
            try
            {
                con.ConnectionString = connstring;
                SqlCommand cmd = new SqlCommand("DELETE FROM Employees WHERE [ID]=@ID", con);
                cmd.Parameters.Add(new SqlParameter("@ID", System.Data.SqlDbType.Int)).Value = ID;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }


        public static List<Employee> drawWinners(int NoOfWinners, int type, out int SetID)
        {
            SqlConnection con = new SqlConnection();
            try
            {
                con.ConnectionString = connstring;
                SetID = insertNewDrawSet(NoOfWinners);

                string strQuery1 = "SELECT TOP " + NoOfWinners.ToString() + " a.* FROM Employees a WHERE ";

                //insert condition, for grandprize winners
                if (type == OLD_ONLY)
                {
                    strQuery1 += "(a.ForGrandPrize=1) AND ";
                }
                else if (type == NEW_ONLY)
                {
                    strQuery1 += "(a.ForGrandPrize=0) AND ";
                }
                else
                {
                      //
                }

                strQuery1 += "a.ID NOT IN (SELECT ID FROM Winners) ORDER BY NEWID()";

                SqlCommand cmd1 = new SqlCommand(strQuery1, con);

                con.Open();
                SqlDataReader dr = cmd1.ExecuteReader();

                List<Employee> winners = new List<Employee>();

                while (dr.Read())
                {
                    Employee e = new Employee();
                    e.ID = Convert.ToInt32(dr["ID"]);
                    e.Name = dr["Employee"].ToString();
                    e.ForGrandPrize = Convert.ToBoolean(dr["ForGrandPrize"]);
                    winners.Add(e);
                }
                con.Close();

                foreach (Employee winner in winners)
                {
                    insertWinner(SetID, winner.ID);
                }

                return winners;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != System.Data.ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }

    }
}