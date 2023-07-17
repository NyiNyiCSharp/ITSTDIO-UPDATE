using Microsoft.EntityFrameworkCore.Migrations;

namespace ITSTDIO_UPDATE_.Migrations
{
    public partial class TableUpdateAddNew : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "TotalPrice",
                table: "Cart",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "TotalQuantity",
                table: "Cart",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "TotalPrice",
                table: "Cart");

            migrationBuilder.DropColumn(
                name: "TotalQuantity",
                table: "Cart");
        }
    }
}
