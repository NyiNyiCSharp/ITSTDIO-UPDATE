using Microsoft.EntityFrameworkCore.Migrations;

namespace ITSTDIO_UPDATE_.Migrations
{
    public partial class forNew009 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Order",
                table: "Order");

            migrationBuilder.RenameTable(
                name: "Order",
                newName: "OrderFromCart");

            migrationBuilder.AddColumn<string>(
                name: "Price",
                table: "OrderFromCart",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_OrderFromCart",
                table: "OrderFromCart",
                column: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_OrderFromCart",
                table: "OrderFromCart");

            migrationBuilder.DropColumn(
                name: "Price",
                table: "OrderFromCart");

            migrationBuilder.RenameTable(
                name: "OrderFromCart",
                newName: "Order");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Order",
                table: "Order",
                column: "Id");
        }
    }
}
