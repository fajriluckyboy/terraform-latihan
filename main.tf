# Konfigurasi provider: memberi tahu Terraform
# bahwa kita akan mengatur resource GitHub,
# dan versi provider yang dipakai
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Provider GitHub butuh autentikasi (token) dan
# nama pemilik (owner) tempat resource akan dibuat.
# Token TIDAK ditulis langsung di sini (bahaya!),
# akan diambil dari environment variable GITHUB_TOKEN
# saat Terraform dijalankan.
provider "github" {
  owner = "fajriluckyboy"
}

# Definisi resource: label baru yang INGIN kita
# buat di repo terraform-latihan. Terraform akan
# BANDINGKAN definisi ini dengan kondisi saat ini,
# lalu buat label ini kalau BELUM ada.
resource "github_issue_label" "iac_label" {
  repository  = "terraform-latihan"
  name        = "infra-as-code"
  color       = "0E8A16"
  description = "Label dibuat otomatis lewat Terraform"
}
