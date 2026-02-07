return {
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  keys = {
    {
      '<leader>dt',
      function()
        require('dap-python').test_method {
          config = {
            env = {
              PROFILE = 'test-local',
            },
          },
        }
      end,
      desc = 'Debug current test method',
    },
    {
      '<leader>dT',
      function()
        require('dap-python').test_class {
          config = {
            env = {
              PROFILE = 'test-local',
            },
          },
        }
      end,
      desc = 'Debug current test class',
    },
    {
      '<leader>ds',
      function()
        require('dap-python').debug_selection()
      end,
      desc = 'Debug visual selection',
      mode = 'v',
    },
  },
  config = function()
    local dap = require 'dap'
    local dap_python = require 'dap-python'

    -- The virutalenv used for the debugpy can be independent from any virtualenv used in projects
    dap_python.setup '~/.virtualenvs/debugpy/bin/python'

    -- Use pytest instead of unittest
    dap_python.test_runner = 'pytest'

    for i, port in ipairs { '8000', '8080' } do
      table.insert(dap.configurations.python, i, {
        name = 'Uvicorn (local :' .. port .. ')',
        type = 'python',
        request = 'launch',
        module = 'uvicorn',
        args = { 'src.main:app', '--host', '0.0.0.0', '--port', port },
        justMyCode = false,
        console = 'integratedTerminal',
        env = {
          PROFILE = 'local',
        },
      })
    end

    table.insert(dap.configurations.python, 3, {
      name = 'Uvicorn (local-cloudsql)',
      type = 'python',
      request = 'launch',
      module = 'uvicorn',
      args = { 'src.main:app', '--host', '0.0.0.0', '--port', '8000' },
      justMyCode = false,
      console = 'integratedTerminal',
      env = {
        PROFILE = 'local-cloudsql',
      },
    })

    table.insert(dap.configurations.python, 4, {
      name = 'Pytest: Current File',
      type = 'python',
      request = 'launch',
      module = 'pytest',
      args = {
        '${file}',
        '-vv',
        '-s',
        '--no-cov',
      },
      console = 'integratedTerminal',
      justMyCode = false,
      env = {
        PROFILE = 'test-local',
        LANGFUSE_ENABLED = 'False',
        PRECONFIGURED_GENAI_BOT = '',
      },
    })

    table.insert(dap.configurations.python, 5, {
      name = 'Run Embedder',
      type = 'python',
      request = 'launch',
      program = '${file}',
      args = { '--db-user=myuser', '--db-password=mypassword', '--db-name=genai-bot' },
      console = 'integratedTerminal',
      justMyCode = false,
      cwd = function()
        return vim.fn.getcwd()
      end,
      env = {
        PYTHONPATH = vim.fn.getcwd(),
      },
    })

    table.insert(dap.configurations.python, 6, {
      name = 'Run Evaluation',
      type = 'python',
      request = 'launch',
      program = '${file}',
      console = 'integratedTerminal',
      justMyCode = false,
      cwd = function()
        return vim.fn.getcwd()
      end,
      env = {
        PYTHONPATH = vim.fn.getcwd(),
      },
    })

    table.insert(dap.configurations.python, 7, {
      name = 'LangGraph Dev',
      type = 'python',
      request = 'launch',
      module = 'langgraph_cli',
      args = {
        'dev',
        '--allow-blocking',
      },
      console = 'integratedTerminal',
      justMyCode = false,
      subProcess = true,
      cwd = function()
        return vim.fn.getcwd()
      end,
      env = {
        PYTHONPATH = vim.fn.getcwd(),
      },
    })

    table.insert(dap.configurations.python, 8, {
      name = 'FastAPI Dev',
      type = 'python',
      request = 'launch',
      module = 'fastapi',
      args = {
        'dev',
        'src/main.py',
        '--app',
        'app',
      },
      console = 'integratedTerminal',
      justMyCode = false,
      cwd = function()
        return vim.fn.getcwd()
      end,
      env = {
        PYTHONPATH = vim.fn.getcwd(),
      },
    })
  end,
}
