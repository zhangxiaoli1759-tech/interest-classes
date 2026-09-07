# 兴趣班课时管理

手机端兴趣班课时管理 H5，方便记录孩子的兴趣班充值与消课。

## 功能
- **兴趣班**：记录名称、充值金额、充值时间、课时数，支持增删改查 + 一键充值
- **消课记录**：记录兴趣班、消课时间、扣除数、备注，支持增删改查；消课时剩余课时自动扣减

## 技术栈
- 前端：原生 HTML + Supabase JS（本地内置 SDK）
- 数据库：Supabase（PostgreSQL，RLS 匿名读写）
- 部署：GitHub Pages

## 访问地址
https://zhangxiaoli1759-tech.github.io/interest-classes/

## 数据表
见 `supabase_schema.sql`（`interest_classes` + `lesson_records`）。
