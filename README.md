# ObanFormatError

This repo is a minimum reproducible setup for https://github.com/sorentwo/oban/issues/532

## How to reproduce:
  1. setup project (mix setup)
  2. iex -S mix
  3. job = Worker.reproduce
  4. wait for about 1 minute 
  
## Example
  
```
iex(1)> Oban.cancel_job(10)
:ok
iex(2)> Worker.reproduce
11
iex(3)> [error] GenServer {Oban.Registry, {Oban, {:producer, "default"}}} terminating
** (MatchError) no match of right hand side value: {0, []}
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:349: Oban.Pro.Queue.SmartEngine.track_jobs/4
    (ecto 3.6.2) lib/ecto/multi.ex:716: Ecto.Multi.apply_operation/5
    (elixir 1.12.3) lib/enum.ex:2385: Enum."-reduce/3-lists^foldl/2-0-"/3
    (ecto 3.6.2) lib/ecto/multi.ex:690: anonymous fn/5 in Ecto.Multi.apply_operations/5
    (ecto_sql 3.6.0) lib/ecto/adapters/sql.ex:1005: anonymous fn/3 in Ecto.Adapters.SQL.checkout_or_transaction/4
    (db_connection 2.4.0) lib/db_connection.ex:1512: DBConnection.run_transaction/4
    (ecto 3.6.2) lib/ecto/repo/transaction.ex:20: Ecto.Repo.Transaction.transaction/4
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:156: anonymous fn/4 in Oban.Pro.Queue.SmartEngine.fetch_jobs/3
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:493: Oban.Pro.Queue.SmartEngine.with_retry/3
    (oban 2.7.1) lib/oban/queue/producer.ex:223: Oban.Queue.Producer.start_jobs/1
    (oban 2.7.1) lib/oban/queue/producer.ex:214: anonymous fn/2 in Oban.Queue.Producer.dispatch/1
    (telemetry 0.4.2) /Users/yiming/Projects/tubi/oban_format_error/deps/telemetry/src/telemetry.erl:262: :telemetry.span/3
    (oban 2.7.1) lib/oban/queue/producer.ex:213: Oban.Queue.Producer.dispatch/1
    (oban 2.7.1) lib/oban/queue/producer.ex:153: Oban.Queue.Producer.handle_info/2
    (stdlib 3.15.2) gen_server.erl:695: :gen_server.try_dispatch/4
    (stdlib 3.15.2) gen_server.erl:771: :gen_server.handle_msg/6
    (stdlib 3.15.2) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
Last message: :dispatch
State: %Oban.Queue.Producer.State{conf: %Oban.Config{circuit_backoff: 30000, dispatch_cooldown: 5, engine: Oban.Pro.Queue.SmartEngine, get_dynamic_repo: nil, log: false, name: Oban, node: "Yiming-Chen-MacBook-Pro", notifier: Oban.PostgresNotifier, plugins: [{Oban.Pro.Plugins.Lifeline, [retry_exhausted: true, rescue_interval: 10000]}, Oban.Plugins.Stager], prefix: "public", queues: [default: [limit: 10]], repo: ObanFormatError.Repo, shutdown_grace_period: 15000}, dispatch_cooldown: 5, dispatch_timer: #Reference<0.723343803.1652293635.169549>, foreman: {:via, Registry, {Oban.Registry, {Oban, {:foreman, "default"}}}}, meta: %Oban.Pro.Producer{__meta__: #Ecto.Schema.Metadata<:loaded, "public", "oban_producers">, meta: %{"local_limit" => 10, "paused" => false}, name: "Oban", node: "Yiming-Chen-MacBook-Pro", queue: "default", running_ids: '\v', started_at: ~U[2021-09-14 12:11:16.444612Z], updated_at: ~U[2021-09-14 12:11:24.208380Z], uuid: "aea3f625-c411-400d-af73-25c96f3e77d0"}, name: {:via, Registry, {Oban.Registry, {Oban, {:producer, "default"}}}}, refresh_interval: 30000, refresh_timer: #Reference<0.723343803.1652293635.169063>, running: %{#Reference<0.723343803.1652293635.169383> => {#PID<0.633.0>, %Oban.Queue.Executor{conf: %Oban.Config{circuit_backoff: 30000, dispatch_cooldown: 5, engine: Oban.Pro.Queue.SmartEngine, get_dynamic_repo: nil, log: false, name: Oban, node: "Yiming-Chen-MacBook-Pro", notifier: Oban.PostgresNotifier, plugins: [{Oban.Pro.Plugins.Lifeline, [retry_exhausted: true, rescue_interval: 10000]}, Oban.Plugins.Stager], prefix: "public", queues: [default: [limit: 10]], repo: ObanFormatError.Repo, shutdown_grace_period: 15000}, duration: 0, error: nil, job: %Oban.Job{__meta__: #Ecto.Schema.Metadata<:loaded, "public", "oban_jobs">, args: %{}, attempt: 1, attempted_at: ~U[2021-09-14 12:11:24.194347Z], attempted_by: ["Yiming-Chen-MacBook-Pro", "aea3f625-c411-400d-af73-25c96f3e77d0"], cancelled_at: nil, completed_at: nil, conf: %Oban.Config{circuit_backoff: 30000, dispatch_cooldown: 5, engine: Oban.Pro.Queue.SmartEngine, get_dynamic_repo: nil, log: false, name: Oban, node: "Yiming-Chen-MacBook-Pro", notifier: Oban.PostgresNotifier, plugins: [{Oban.Pro.Plugins.Lifeline, [retry_exhausted: true, rescue_interval: 10000]}, Oban.Plugins.Stager], prefix: "public", queues: [default: [limit: 10]], repo: ObanFormatError.Repo, shutdown_grace_period: 15000}, conflict?: false, discarded_at: nil, errors: [], id: 11, inserted_at: ~U[2021-09-14 12:11:24.009387Z], max_attempts: 2, meta: %{}, priority: 0, queue: "default", replace: nil, scheduled_at: ~U[2021-09-14 12:11:24.009387Z], state: "executing", tags: [], unique: nil, unsaved_error: nil, worker: "Worker"}, kind: :error, meta: %{args: %{}, attempt: 1, conf: %Oban.Config{circuit_backoff: 30000, dispatch_cooldown: 5, engine: Oban.Pro.Queue.SmartEngine, get_dynamic_repo: nil, log: false, name: Oban, node: "Yiming-Chen-MacBook-Pro", notifier: Oban.PostgresNotifier, plugins: [{Oban.Pro.Plugins.Lifeline, [retry_exhausted: true, rescue_interval: 10000]}, Oban.Plugins.Stager], prefix: "public", queues: [default: [limit: 10]], repo: ObanFormatError.Repo, shutdown_grace_period: 15000}, id: 11, job: %Oban.Job{__meta__: #Ecto.Schema.Metadata<:loaded, "public", "oban_jobs">, args: %{}, attempt: 1, attempted_at: ~U[2021-09-14 12:11:24.194347Z], attempted_by: ["Yiming-Chen-MacBook-Pro", "aea3f625-c411-400d-af73-25c96f3e77d0"], cancelled_at: nil, completed_at: nil, conf: nil, conflict?: false, discarded_at: nil, errors: [], id: 11, inserted_at: ~U[2021-09-14 12:11:24.009387Z], max_attempts: 2, meta: %{}, priority: 0, queue: "default", replace: nil, scheduled_at: ~U[2021-09-14 12:11:24.009387Z], state: "executing", tags: [], unique: nil, unsaved_error: nil, worker: "Worker"}, max_attempts: 2, prefix: "public", queue: "default", tags: [], worker: "Worker"}, queue_time: 0, result: nil, safe: true, snooze: nil, stacktrace: [], start_mono: -576460742040190000, start_time: 1631621484200426000, state: :unset, stop_mono: nil, worker: nil}}}}
iex(3)> Oban.cancel_job(11)
:ok
iex(4)> Oban.cancel_job(10)
BREAK: (a)bort (A)bort with dump (c)ontinue (p)roc info (i)nfo
       (l)oaded (v)ersion (k)ill (D)b-tables (d)istribution
^C
~/Projects/tubi/oban_format_error master* 38s
(base) base ❯ iex -S /usr/local/bin/mix
Erlang/OTP 24 [erts-12.0.3] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit] [dtrace]

Compiling 1 file (.ex)
Interactive Elixir (1.12.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> job = Worker.reproduce()
%Oban.Job{
  __meta__: #Ecto.Schema.Metadata<:loaded, "public", "oban_jobs">,
  args: %{},
  attempt: 0,
  attempted_at: nil,
  attempted_by: nil,
  cancelled_at: nil,
  completed_at: nil,
  conf: nil,
  conflict?: false,
  discarded_at: nil,
  errors: [],
  id: 12,
  inserted_at: nil,
  max_attempts: 2,
  meta: %{},
  priority: 0,
  queue: "default",
  replace: nil,
  scheduled_at: nil,
  state: "available",
  tags: [],
  unique: nil,
  unsaved_error: nil,
  worker: "Worker"
}
iex(2)> ObanFormatError.Repo.reload(job)
[debug] QUERY OK source="oban_jobs" db=0.4ms queue=0.9ms idle=1658.1ms
SELECT o0."id", o0."state", o0."queue", o0."worker", o0."args", o0."meta", o0."tags", o0."errors", o0."attempt", o0."attempted_by", o0."max_attempts", o0."priority", o0."attempted_at", o0."cancelled_at", o0."completed_at", o0."discarded_at", o0."inserted_at", o0."scheduled_at" FROM "public"."oban_jobs" AS o0 WHERE (o0."id" = ANY($1)) [[12]]
%Oban.Job{
  __meta__: #Ecto.Schema.Metadata<:loaded, "public", "oban_jobs">,
  args: %{},
  attempt: 1,
  attempted_at: ~U[2021-09-14 12:12:00.189590Z],
  attempted_by: ["Yiming-Chen-MacBook-Pro",
   "983f265a-8e89-4eeb-aec8-8dcdb5541ecb"],
  cancelled_at: nil,
  completed_at: nil,
  conf: nil,
  conflict?: false,
  discarded_at: nil,
  errors: [],
  id: 12,
  inserted_at: ~U[2021-09-14 12:12:00.166580Z],
  max_attempts: 2,
  meta: %{},
  priority: 0,
  queue: "default",
  replace: nil,
  scheduled_at: ~U[2021-09-14 12:12:00.166580Z],
  state: "executing",
  tags: [],
  unique: nil,
  unsaved_error: nil,
  worker: "Worker"
}
iex(3)> [error] GenServer {Oban.Registry, {Oban, {:producer, "default"}}} terminating
** (MatchError) no match of right hand side value: {0, []}
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:349: Oban.Pro.Queue.SmartEngine.track_jobs/4
    (ecto 3.6.2) lib/ecto/multi.ex:716: Ecto.Multi.apply_operation/5
    (elixir 1.12.3) lib/enum.ex:2385: Enum."-reduce/3-lists^foldl/2-0-"/3
    (ecto 3.6.2) lib/ecto/multi.ex:690: anonymous fn/5 in Ecto.Multi.apply_operations/5
    (ecto_sql 3.6.0) lib/ecto/adapters/sql.ex:1005: anonymous fn/3 in Ecto.Adapters.SQL.checkout_or_transaction/4
    (db_connection 2.4.0) lib/db_connection.ex:1512: DBConnection.run_transaction/4
    (ecto 3.6.2) lib/ecto/repo/transaction.ex:20: Ecto.Repo.Transaction.transaction/4
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:156: anonymous fn/4 in Oban.Pro.Queue.SmartEngine.fetch_jobs/3
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:493: Oban.Pro.Queue.SmartEngine.with_retry/3
    (oban 2.7.1) lib/oban/queue/producer.ex:223: Oban.Queue.Producer.start_jobs/1
    (oban 2.7.1) lib/oban/queue/producer.ex:214: anonymous fn/2 in Oban.Queue.Producer.dispatch/1
    (telemetry 0.4.2) /Users/yiming/Projects/tubi/oban_format_error/deps/telemetry/src/telemetry.erl:262: :telemetry.span/3
    (oban 2.7.1) lib/oban/queue/producer.ex:213: Oban.Queue.Producer.dispatch/1
    (oban 2.7.1) lib/oban/queue/producer.ex:153: Oban.Queue.Producer.handle_info/2
    (stdlib 3.15.2) gen_server.erl:695: :gen_server.try_dispatch/4
    (stdlib 3.15.2) gen_server.erl:771: :gen_server.handle_msg/6
    (stdlib 3.15.2) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
Last message: :dispatch
State: %Oban.Queue.Producer.State{conf: %Oban.Config{circuit_backoff: 30000, dispatch_cooldown: 5, engine: Oban.Pro.Queue.SmartEngine, get_dynamic_repo: nil, log: false, name: Oban, node: "Yiming-Chen-MacBook-Pro", notifier: Oban.PostgresNotifier, plugins: [{Oban.Pro.Plugins.Lifeline, [retry_exhausted: true, rescue_interval: 10000]}, Oban.Plugins.Stager], prefix: "public", queues: [default: [limit: 10]], repo: ObanFormatError.Repo, shutdown_grace_period: 15000}, dispatch_cooldown: 5, dispatch_timer: #Reference<0.919791759.3263430660.25800>, foreman: {:via, Registry, {Oban.Registry, {Oban, {:foreman, "default"}}}}, meta: %Oban.Pro.Producer{__meta__: #Ecto.Schema.Metadata<:loaded, "public", "oban_producers">, meta: %{"local_limit" => 10, "paused" => false}, name: "Oban", node: "Yiming-Chen-MacBook-Pro", queue: "default", running_ids: '\f', started_at: ~U[2021-09-14 12:11:53.910005Z], updated_at: ~U[2021-09-14 12:12:00.196032Z], uuid: "983f265a-8e89-4eeb-aec8-8dcdb5541ecb"}, name: {:via, Registry, {Oban.Registry, {Oban, {:producer, "default"}}}}, refresh_interval: 30000, refresh_timer: #Reference<0.919791759.3263430661.34203>, running: %{#Reference<0.919791759.3263430660.25712> => {#PID<0.507.0>, %Oban.Queue.Executor{conf: %Oban.Config{circuit_backoff: 30000, dispatch_cooldown: 5, engine: Oban.Pro.Queue.SmartEngine, get_dynamic_repo: nil, log: false, name: Oban, node: "Yiming-Chen-MacBook-Pro", notifier: Oban.PostgresNotifier, plugins: [{Oban.Pro.Plugins.Lifeline, [retry_exhausted: true, rescue_interval: 10000]}, Oban.Plugins.Stager], prefix: "public", queues: [default: [limit: 10]], repo: ObanFormatError.Repo, shutdown_grace_period: 15000}, duration: 0, error: nil, job: %Oban.Job{__meta__: #Ecto.Schema.Metadata<:loaded, "public", "oban_jobs">, args: %{}, attempt: 1, attempted_at: ~U[2021-09-14 12:12:00.189590Z], attempted_by: ["Yiming-Chen-MacBook-Pro", "983f265a-8e89-4eeb-aec8-8dcdb5541ecb"], cancelled_at: nil, completed_at: nil, conf: %Oban.Config{circuit_backoff: 30000, dispatch_cooldown: 5, engine: Oban.Pro.Queue.SmartEngine, get_dynamic_repo: nil, log: false, name: Oban, node: "Yiming-Chen-MacBook-Pro", notifier: Oban.PostgresNotifier, plugins: [{Oban.Pro.Plugins.Lifeline, [retry_exhausted: true, rescue_interval: 10000]}, Oban.Plugins.Stager], prefix: "public", queues: [default: [limit: 10]], repo: ObanFormatError.Repo, shutdown_grace_period: 15000}, conflict?: false, discarded_at: nil, errors: [], id: 12, inserted_at: ~U[2021-09-14 12:12:00.166580Z], max_attempts: 2, meta: %{}, priority: 0, queue: "default", replace: nil, scheduled_at: ~U[2021-09-14 12:12:00.166580Z], state: "executing", tags: [], unique: nil, unsaved_error: nil, worker: "Worker"}, kind: :error, meta: %{args: %{}, attempt: 1, conf: %Oban.Config{circuit_backoff: 30000, dispatch_cooldown: 5, engine: Oban.Pro.Queue.SmartEngine, get_dynamic_repo: nil, log: false, name: Oban, node: "Yiming-Chen-MacBook-Pro", notifier: Oban.PostgresNotifier, plugins: [{Oban.Pro.Plugins.Lifeline, [retry_exhausted: true, rescue_interval: 10000]}, Oban.Plugins.Stager], prefix: "public", queues: [default: [limit: 10]], repo: ObanFormatError.Repo, shutdown_grace_period: 15000}, id: 12, job: %Oban.Job{__meta__: #Ecto.Schema.Metadata<:loaded, "public", "oban_jobs">, args: %{}, attempt: 1, attempted_at: ~U[2021-09-14 12:12:00.189590Z], attempted_by: ["Yiming-Chen-MacBook-Pro", "983f265a-8e89-4eeb-aec8-8dcdb5541ecb"], cancelled_at: nil, completed_at: nil, conf: nil, conflict?: false, discarded_at: nil, errors: [], id: 12, inserted_at: ~U[2021-09-14 12:12:00.166580Z], max_attempts: 2, meta: %{}, priority: 0, queue: "default", replace: nil, scheduled_at: ~U[2021-09-14 12:12:00.166580Z], state: "executing", tags: [], unique: nil, unsaved_error: nil, worker: "Worker"}, max_attempts: 2, prefix: "public", queue: "default", tags: [], worker: "Worker"}, queue_time: 0, result: nil, safe: true, snooze: nil, stacktrace: [], start_mono: -576460744324164000, start_time: 1631621520200362000, state: :unset, stop_mono: nil, worker: nil}}}}
iex(3)> ObanFormatError.Repo.reload(job)
[debug] QUERY OK source="oban_jobs" db=1.3ms queue=0.2ms idle=1520.2ms
SELECT o0."id", o0."state", o0."queue", o0."worker", o0."args", o0."meta", o0."tags", o0."errors", o0."attempt", o0."attempted_by", o0."max_attempts", o0."priority", o0."attempted_at", o0."cancelled_at", o0."completed_at", o0."discarded_at", o0."inserted_at", o0."scheduled_at" FROM "public"."oban_jobs" AS o0 WHERE (o0."id" = ANY($1)) [[12]]
%Oban.Job{
  __meta__: #Ecto.Schema.Metadata<:loaded, "public", "oban_jobs">,
  args: %{},
  attempt: 2,
  attempted_at: ~U[2021-09-14 12:12:14.994008Z],
  attempted_by: ["Yiming-Chen-MacBook-Pro",
   "c2920bee-f801-4b06-8df6-2c9c6e163791"],
  cancelled_at: nil,
  completed_at: nil,
  conf: nil,
  conflict?: false,
  discarded_at: ~U[2021-09-14 12:12:15.003886Z],
  errors: [
    %{
      "at" => "2021-09-14T12:12:15.003890Z",
      "attempt" => 2,
      "error" => "** (RuntimeError) attempt 2 failed\n    (oban_format_error 0.1.0) lib/oban_format_error/worker.ex:23: Worker.perform/1\n    (oban 2.7.1) lib/oban/queue/executor.ex:209: Oban.Queue.Executor.perform_inline/1\n    (oban 2.7.1) lib/oban/queue/executor.ex:197: Oban.Queue.Executor.perform_inline/1\n    (oban 2.7.1) lib/oban/queue/executor.ex:82: Oban.Queue.Executor.call/1\n    (elixir 1.12.3) lib/task/supervised.ex:90: Task.Supervised.invoke_mfa/2\n    (elixir 1.12.3) lib/task/supervised.ex:35: Task.Supervised.reply/5\n    (stdlib 3.15.2) proc_lib.erl:226: :proc_lib.init_p_do_apply/3\n"
    }
  ],
  id: 12,
  inserted_at: ~U[2021-09-14 12:12:00.166580Z],
  max_attempts: 2,
  meta: %{},
  priority: 0,
  queue: "default",
  replace: nil,
  scheduled_at: ~U[2021-09-14 12:12:00.166580Z],
  state: "discarded",
  tags: [],
  unique: nil,
  unsaved_error: nil,
  worker: "Worker"
}
iex(4)> [error] GenServer {Oban.Registry, {Oban, {:producer, "default"}}} terminating
** (MatchError) no match of right hand side value: {0, []}
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:100: anonymous fn/2 in Oban.Pro.Queue.SmartEngine.refresh/2
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:493: Oban.Pro.Queue.SmartEngine.with_retry/3
    (oban 2.7.1) lib/oban/queue/producer.ex:157: Oban.Queue.Producer.handle_info/2
    (stdlib 3.15.2) gen_server.erl:695: :gen_server.try_dispatch/4
    (stdlib 3.15.2) gen_server.erl:771: :gen_server.handle_msg/6
    (stdlib 3.15.2) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
Last message: :refresh
State: %Oban.Queue.Producer.State{conf: %Oban.Config{circuit_backoff: 30000, dispatch_cooldown: 5, engine: Oban.Pro.Queue.SmartEngine, get_dynamic_repo: nil, log: false, name: Oban, node: "Yiming-Chen-MacBook-Pro", notifier: Oban.PostgresNotifier, plugins: [{Oban.Pro.Plugins.Lifeline, [retry_exhausted: true, rescue_interval: 10000]}, Oban.Plugins.Stager], prefix: "public", queues: [default: [limit: 10]], repo: ObanFormatError.Repo, shutdown_grace_period: 15000}, dispatch_cooldown: 5, dispatch_timer: nil, foreman: {:via, Registry, {Oban.Registry, {Oban, {:foreman, "default"}}}}, meta: %Oban.Pro.Producer{__meta__: #Ecto.Schema.Metadata<:loaded, "public", "oban_producers">, meta: %{"local_limit" => 10, "paused" => false}, name: "Oban", node: "Yiming-Chen-MacBook-Pro", queue: "default", running_ids: [], started_at: ~U[2021-09-14 12:12:14.016912Z], updated_at: ~U[2021-09-14 12:12:15.015818Z], uuid: "c2920bee-f801-4b06-8df6-2c9c6e163791"}, name: {:via, Registry, {Oban.Registry, {Oban, {:producer, "default"}}}}, refresh_interval: 30000, refresh_timer: #Reference<0.919791759.3263430658.26650>, running: %{}}
iex(4)> ObanFormatError.Repo.reload(job)
[debug] QUERY OK source="oban_jobs" db=1.3ms idle=1602.9ms
SELECT o0."id", o0."state", o0."queue", o0."worker", o0."args", o0."meta", o0."tags", o0."errors", o0."attempt", o0."attempted_by", o0."max_attempts", o0."priority", o0."attempted_at", o0."cancelled_at", o0."completed_at", o0."discarded_at", o0."inserted_at", o0."scheduled_at" FROM "public"."oban_jobs" AS o0 WHERE (o0."id" = ANY($1)) [[12]]
%Oban.Job{
  __meta__: #Ecto.Schema.Metadata<:loaded, "public", "oban_jobs">,
  args: %{},
  attempt: 2,
  attempted_at: ~U[2021-09-14 12:12:14.994008Z],
  attempted_by: ["Yiming-Chen-MacBook-Pro",
   "c2920bee-f801-4b06-8df6-2c9c6e163791"],
  cancelled_at: nil,
  completed_at: nil,
  conf: nil,
  conflict?: false,
  discarded_at: ~U[2021-09-14 12:12:15.003886Z],
  errors: [
    %{
      "at" => "2021-09-14T12:12:15.003890Z",
      "attempt" => 2,
      "error" => "** (RuntimeError) attempt 2 failed\n    (oban_format_error 0.1.0) lib/oban_format_error/worker.ex:23: Worker.perform/1\n    (oban 2.7.1) lib/oban/queue/executor.ex:209: Oban.Queue.Executor.perform_inline/1\n    (oban 2.7.1) lib/oban/queue/executor.ex:197: Oban.Queue.Executor.perform_inline/1\n    (oban 2.7.1) lib/oban/queue/executor.ex:82: Oban.Queue.Executor.call/1\n    (elixir 1.12.3) lib/task/supervised.ex:90: Task.Supervised.invoke_mfa/2\n    (elixir 1.12.3) lib/task/supervised.ex:35: Task.Supervised.reply/5\n    (stdlib 3.15.2) proc_lib.erl:226: :proc_lib.init_p_do_apply/3\n"
    },
    %{
      "at" => "2021-09-14T12:13:00.010157Z",
      "attempt" => 1,
      "error" => "** (RuntimeError) attempt 1 failed\n    (oban_format_error 0.1.0) lib/oban_format_error/worker.ex:19: Worker.perform/1\n    (oban 2.7.1) lib/oban/queue/executor.ex:209: Oban.Queue.Executor.perform_inline/1\n    (oban 2.7.1) lib/oban/queue/executor.ex:197: Oban.Queue.Executor.perform_inline/1\n    (oban 2.7.1) lib/oban/queue/executor.ex:82: Oban.Queue.Executor.call/1\n    (elixir 1.12.3) lib/task/supervised.ex:90: Task.Supervised.invoke_mfa/2\n    (elixir 1.12.3) lib/task/supervised.ex:35: Task.Supervised.reply/5\n    (stdlib 3.15.2) proc_lib.erl:226: :proc_lib.init_p_do_apply/3\n"
    }
  ],
  id: 12,
  inserted_at: ~U[2021-09-14 12:12:00.166580Z],
  max_attempts: 2,
  meta: %{},
  priority: 0,
  queue: "default",
  replace: nil,
  scheduled_at: ~U[2021-09-14 12:13:16.010145Z],
  state: "retryable",
  tags: [],
  unique: nil,
  unsaved_error: nil,
  worker: "Worker"
}
iex(5)> [error] GenServer {Oban.Registry, {Oban, {:producer, "default"}}} terminating
** (MatchError) no match of right hand side value: {0, []}
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:100: anonymous fn/2 in Oban.Pro.Queue.SmartEngine.refresh/2
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:493: Oban.Pro.Queue.SmartEngine.with_retry/3
    (oban 2.7.1) lib/oban/queue/producer.ex:157: Oban.Queue.Producer.handle_info/2
    (stdlib 3.15.2) gen_server.erl:695: :gen_server.try_dispatch/4
    (stdlib 3.15.2) gen_server.erl:771: :gen_server.handle_msg/6
    (stdlib 3.15.2) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
Last message: :refresh
State: %Oban.Queue.Producer.State{conf: %Oban.Config{circuit_backoff: 30000, dispatch_cooldown: 5, engine: Oban.Pro.Queue.SmartEngine, get_dynamic_repo: nil, log: false, name: Oban, node: "Yiming-Chen-MacBook-Pro", notifier: Oban.PostgresNotifier, plugins: [{Oban.Pro.Plugins.Lifeline, [retry_exhausted: true, rescue_interval: 10000]}, Oban.Plugins.Stager], prefix: "public", queues: [default: [limit: 10]], repo: ObanFormatError.Repo, shutdown_grace_period: 15000}, dispatch_cooldown: 5, dispatch_timer: nil, foreman: {:via, Registry, {Oban.Registry, {Oban, {:foreman, "default"}}}}, meta: %Oban.Pro.Producer{__meta__: #Ecto.Schema.Metadata<:loaded, "public", "oban_producers">, meta: %{"local_limit" => 10, "paused" => false}, name: "Oban", node: "Yiming-Chen-MacBook-Pro", queue: "default", running_ids: [], started_at: ~U[2021-09-14 12:12:44.021186Z], updated_at: ~U[2021-09-14 12:12:44.021186Z], uuid: "aece1a6a-190a-432a-94f1-c603bb6d66e1"}, name: {:via, Registry, {Oban.Registry, {Oban, {:producer, "default"}}}}, refresh_interval: 30000, refresh_timer: #Reference<0.919791759.3263430661.34785>, running: %{}}
[error] GenServer {Oban.Registry, {Oban, {:producer, "default"}}} terminating
** (Postgrex.Error) ERROR 23514 (check_violation) new row for relation "oban_jobs" violates check constraint "attempt_range"

    table: oban_jobs
    constraint: attempt_range

Failing row contains (12, executing, default, Worker, {}, {"{\"at\": \"2021-09-14T12:12:15.003890Z\", \"error\": \"** (Run..., 3, 2, 2021-09-14 12:12:00.16658, 2021-09-14 12:13:16.010145, 2021-09-14 12:13:23.832647, null, {Yiming-Chen-MacBook-Pro,645fb73d-18cb-410d-ab15-c5305a8d1f97}, 2021-09-14 12:12:15.003886, 0, {}, {}, null).
    (ecto_sql 3.6.0) lib/ecto/adapters/sql.ex:749: Ecto.Adapters.SQL.raise_sql_call_error/1
    (ecto_sql 3.6.0) lib/ecto/adapters/sql.ex:682: Ecto.Adapters.SQL.execute/5
    (ecto 3.6.2) lib/ecto/repo/queryable.ex:224: Ecto.Repo.Queryable.execute/4
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:330: Oban.Pro.Queue.SmartEngine.fetch_jobs/4
    (ecto 3.6.2) lib/ecto/multi.ex:716: Ecto.Multi.apply_operation/5
    (elixir 1.12.3) lib/enum.ex:2385: Enum."-reduce/3-lists^foldl/2-0-"/3
    (ecto 3.6.2) lib/ecto/multi.ex:690: anonymous fn/5 in Ecto.Multi.apply_operations/5
    (ecto_sql 3.6.0) lib/ecto/adapters/sql.ex:1005: anonymous fn/3 in Ecto.Adapters.SQL.checkout_or_transaction/4
    (db_connection 2.4.0) lib/db_connection.ex:1512: DBConnection.run_transaction/4
    (ecto 3.6.2) lib/ecto/repo/transaction.ex:20: Ecto.Repo.Transaction.transaction/4
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:156: anonymous fn/4 in Oban.Pro.Queue.SmartEngine.fetch_jobs/3
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:493: Oban.Pro.Queue.SmartEngine.with_retry/3
    (oban 2.7.1) lib/oban/queue/producer.ex:223: Oban.Queue.Producer.start_jobs/1
    (oban 2.7.1) lib/oban/queue/producer.ex:214: anonymous fn/2 in Oban.Queue.Producer.dispatch/1
    (telemetry 0.4.2) /Users/yiming/Projects/tubi/oban_format_error/deps/telemetry/src/telemetry.erl:262: :telemetry.span/3
    (oban 2.7.1) lib/oban/queue/producer.ex:213: Oban.Queue.Producer.dispatch/1
    (oban 2.7.1) lib/oban/queue/producer.ex:153: Oban.Queue.Producer.handle_info/2
    (stdlib 3.15.2) gen_server.erl:695: :gen_server.try_dispatch/4
    (stdlib 3.15.2) gen_server.erl:771: :gen_server.handle_msg/6
    (stdlib 3.15.2) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
Last message: :dispatch
State: %Oban.Queue.Producer.State{conf: %Oban.Config{circuit_backoff: 30000, dispatch_cooldown: 5, engine: Oban.Pro.Queue.SmartEngine, get_dynamic_repo: nil, log: false, name: Oban, node: "Yiming-Chen-MacBook-Pro", notifier: Oban.PostgresNotifier, plugins: [{Oban.Pro.Plugins.Lifeline, [retry_exhausted: true, rescue_interval: 10000]}, Oban.Plugins.Stager], prefix: "public", queues: [default: [limit: 10]], repo: ObanFormatError.Repo, shutdown_grace_period: 15000}, dispatch_cooldown: 5, dispatch_timer: #Reference<0.919791759.3263430661.35009>, foreman: {:via, Registry, {Oban.Registry, {Oban, {:foreman, "default"}}}}, meta: %Oban.Pro.Producer{__meta__: #Ecto.Schema.Metadata<:loaded, "public", "oban_producers">, meta: %{"local_limit" => 10, "paused" => false}, name: "Oban", node: "Yiming-Chen-MacBook-Pro", queue: "default", running_ids: [], started_at: ~U[2021-09-14 12:13:13.897192Z], updated_at: ~U[2021-09-14 12:13:13.897192Z], uuid: "645fb73d-18cb-410d-ab15-c5305a8d1f97"}, name: {:via, Registry, {Oban.Registry, {Oban, {:producer, "default"}}}}, refresh_interval: 30000, refresh_timer: #Reference<0.919791759.3263430661.34974>, running: %{}}
[error] GenServer {Oban.Registry, {Oban, {:producer, "default"}}} terminating
** (Postgrex.Error) ERROR 23514 (check_violation) new row for relation "oban_jobs" violates check constraint "attempt_range"

    table: oban_jobs
    constraint: attempt_range

Failing row contains (12, executing, default, Worker, {}, {"{\"at\": \"2021-09-14T12:12:15.003890Z\", \"error\": \"** (Run..., 3, 2, 2021-09-14 12:12:00.16658, 2021-09-14 12:13:16.010145, 2021-09-14 12:13:32.778965, null, {Yiming-Chen-MacBook-Pro,ef02f244-65b3-4771-afc1-8c858446ac21}, 2021-09-14 12:12:15.003886, 0, {}, {}, null).
    (ecto_sql 3.6.0) lib/ecto/adapters/sql.ex:749: Ecto.Adapters.SQL.raise_sql_call_error/1
    (ecto_sql 3.6.0) lib/ecto/adapters/sql.ex:682: Ecto.Adapters.SQL.execute/5
    (ecto 3.6.2) lib/ecto/repo/queryable.ex:224: Ecto.Repo.Queryable.execute/4
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:330: Oban.Pro.Queue.SmartEngine.fetch_jobs/4
    (ecto 3.6.2) lib/ecto/multi.ex:716: Ecto.Multi.apply_operation/5
    (elixir 1.12.3) lib/enum.ex:2385: Enum."-reduce/3-lists^foldl/2-0-"/3
    (ecto 3.6.2) lib/ecto/multi.ex:690: anonymous fn/5 in Ecto.Multi.apply_operations/5
    (ecto_sql 3.6.0) lib/ecto/adapters/sql.ex:1005: anonymous fn/3 in Ecto.Adapters.SQL.checkout_or_transaction/4
    (db_connection 2.4.0) lib/db_connection.ex:1512: DBConnection.run_transaction/4
    (ecto 3.6.2) lib/ecto/repo/transaction.ex:20: Ecto.Repo.Transaction.transaction/4
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:156: anonymous fn/4 in Oban.Pro.Queue.SmartEngine.fetch_jobs/3
    (oban_pro 0.8.1) lib/oban/pro/queue/smart_engine.ex:493: Oban.Pro.Queue.SmartEngine.with_retry/3
    (oban 2.7.1) lib/oban/queue/producer.ex:223: Oban.Queue.Producer.start_jobs/1
    (oban 2.7.1) lib/oban/queue/producer.ex:214: anonymous fn/2 in Oban.Queue.Producer.dispatch/1
    (telemetry 0.4.2) /Users/yiming/Projects/tubi/oban_format_error/deps/telemetry/src/telemetry.erl:262: :telemetry.span/3
    (oban 2.7.1) lib/oban/queue/producer.ex:213: Oban.Queue.Producer.dispatch/1
    (oban 2.7.1) lib/oban/queue/producer.ex:153: Oban.Queue.Producer.handle_info/2
    (stdlib 3.15.2) gen_server.erl:695: :gen_server.try_dispatch/4
    (stdlib 3.15.2) gen_server.erl:771: :gen_server.handle_msg/6
    (stdlib 3.15.2) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
Last message: :dispatch
State: %Oban.Queue.Producer.State{conf: %Oban.Config{circuit_backoff: 30000, dispatch_cooldown: 5, engine: Oban.Pro.Queue.SmartEngine, get_dynamic_repo: nil, log: false, name: Oban, node: "Yiming-Chen-MacBook-Pro", notifier: Oban.PostgresNotifier, plugins: [{Oban.Pro.Plugins.Lifeline, [retry_exhausted: true, rescue_interval: 10000]}, Oban.Plugins.Stager], prefix: "public", queues: [default: [limit: 10]], repo: ObanFormatError.Repo, shutdown_grace_period: 15000}, dispatch_cooldown: 5, dispatch_timer: #Reference<0.919791759.3263430658.27252>, foreman: {:via, Registry, {Oban.Registry, {Oban, {:foreman, "default"}}}}, meta: %Oban.Pro.Producer{__meta__: #Ecto.Schema.Metadata<:loaded, "public", "oban_producers">, meta: %{"local_limit" => 10, "paused" => false}, name: "Oban", node: "Yiming-Chen-MacBook-Pro", queue: "default", running_ids: [], started_at: ~U[2021-09-14 12:13:23.835872Z], updated_at: ~U[2021-09-14 12:13:23.835872Z], uuid: "ef02f244-65b3-4771-afc1-8c858446ac21"}, name: {:via, Registry, {Oban.Registry, {Oban, {:producer, "default"}}}}, refresh_interval: 30000, refresh_timer: #Reference<0.919791759.3263430658.27240>, running: %{}}
```

## What happened?

TL;DR: 
the same job gets performed twice at the same time, 
and both attempts failed, 
but a later attempt finished earlier

1. the job was fetched by Pro.Producer A, job.attempt increased to 2,
2. Pro.Producer A crashed (job attempt 2 was still running in foreman Task.Supervisor)
3. the job gets rescued to "available" state by lifeline
4. the job was fetched by Pro.Producer B, job.attempt increased to 3,
5. attempt 3 finished earlier
6. attempt 2 finished later, increased attempt to 3 (but the state was
    updated from discarded to retryable)
