# OpsPilot Windows 本地运行

项目目录：`E:\codex项目\tmp\repos\EvoHarnessAlert`。

启动：在 PowerShell 执行 `powershell -ExecutionPolicy Bypass -File .\scripts\start-windows.ps1`。
访问 http://127.0.0.1:8095 ，在工作台点击“连接后端”，本地演示账号为 `admin/admin123`。
当前实例：SQLite 持久化、Mock 模型、日志通知、BM25 检索。MySQL、Redis、向量检索尚未完成本机联调。

## API 配置留待填写

编辑项目根目录 `.env` 的 `OPENAI_BASE_URL`、`OPENAI_API_KEY`、`OPENAI_MODEL`，并把 `AI_PROVIDER` 改为 `openai`，重启服务。
如果供应商使用 Responses 接口，还需按其接口设置 `OPENAI_WIRE_API=responses`。
API 留空时使用 Mock，不会向外部模型发送请求。
SMTP 通知和向量检索属于独立可选接入，填写模型 API 并不等于这些功能已经启用。

## 当前验收

2026-10-13：224 passed、3 skipped；跳过项为缺少专用 MySQL 测试库的集成测试。
已修复模型资产接口 Windows 路径格式；测试需启用 `PYTHONUTF8=1`。
健康接口、静态前端、P0 Webhook 接入、Incident 查询均返回 HTTP 200。
此结果是本地演示验收，不是生产告警诊断准确率或生产安全验收。

## 依赖说明

使用 `.venv-local` 虚拟环境，基础依赖已安装。Chroma 0.5.23 的 hnswlib 需要本机 Visual C++ 构建工具，暂未安装；向量功能关闭时可使用 BM25。
仓库原始安装命令 `pip install -r requirements.txt` 在当前 Windows 环境会因此失败。

数据库文件 `target-local.sqlite`、Excel 台账为本地演示运行数据。配置与运行数据不提交到 Git。
当前项目来自上游开源仓库，简历贡献需按自己实际完成的二次开发和验证表述。
