using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace ACSWebProject.Models;

public partial class AcsContext : DbContext
{
    public AcsContext()
    {
    }

    public AcsContext(DbContextOptions<AcsContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Error> Errors { get; set; }

    public virtual DbSet<Setting> Settings { get; set; }

    public virtual DbSet<WebRequest> WebRequests { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("server=Walter-HP\\DEVDB;Database=ACS;Integrated Security=true;Trusted_Connection=true;TrustServerCertificate=true;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Error>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Errors__3214EC070A8D1189");

            entity.Property(e => e.Message).IsUnicode(false);
            entity.Property(e => e.Type)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Setting>(entity =>
        {
            entity.HasNoKey();

            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Value)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<WebRequest>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__WebReque__3214EC076FE4A75A");

            entity.Property(e => e.ResponseCode)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ResponsePayload).IsUnicode(false);
            entity.Property(e => e.Status)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.Url)
                .IsUnicode(false)
                .HasColumnName("URL");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
