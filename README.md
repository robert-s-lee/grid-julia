# grid-julia

Grid.ai example of passing Julia arguments

- setup Julia on OSX
```
brew install --cask julia
```
- Test locally
```bash
julia hello.jl
run.sh hello.jl
run2.sh 
```
- Burst to Cloud on Grid.ai
```bash
grid run --framework julia run.sh hello.jl
grid run --framework julia run2.sh 
```

- Burst to Cloud on Grid.ai with Grid Search
```bash
grid run --framework julia run.sh hello.jl --arg1 "[1,2,3]"
```

```bash
2022-01-25T15:55:53-05:00
Arguments
2022-01-25T15:55:53-05:00
--arg1 3 --hello.jl hello.jl
2022-01-25T15:55:53-05:00
Arguments
2022-01-25T15:55:53-05:00
--arg1 3
2022-01-25T15:55:53-05:00
julia --project --threads auto -O1 hello.jl --arg1 3
2022-01-25T15:55:54-05:00
Hello World
```
- Use Dockerfile with Julia 1.7

grid run --dockerfile julia.dockerfile --name julia-$(date '+%m%d-%H%M%S') --framework julia hello.jl

- Burst to Cloud on Grid.ai with Random Search [ WILL FAIL NOW.  FILED BUG REPORT ]

  - per `grid run --help` random search require these two parameters to be set
```
--strategy [grid_search|random_search]                      │ Hyper-parameter search strategy
--trials INTEGER                                            │ Number of trials to run hyper parameter search  
```
  - both methods fails now
```
grid run --framework julia --strategy random_search --trials 2 run.sh --arg1 "[1,2,3]"
grid run --framework julia --strategy random_search --num_trials 2 run.sh --arg1 "[1,2,3]"
```

  - `--strategy random_search` wants `--num_trials`
```
 grid run --framework julia --strategy random_search --trials 2 run.sh --arg1 "[1,2,3]"

Traceback (most recent call last):
  File "/opt/miniconda3/envs/gridai/bin/grid", line 8, in <module>
    sys.exit(main())
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/click/core.py", line 1128, in __call__
    return self.main(*args, **kwargs)
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/click/core.py", line 1053, in main
    rv = self.invoke(ctx)
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/click/core.py", line 1659, in invoke
    return _process_result(sub_ctx.command.invoke(sub_ctx))
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/click/core.py", line 1395, in invoke
    return ctx.invoke(self.callback, **ctx.params)
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/click/core.py", line 754, in invoke
    return __callback(*args, **kwargs)
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/grid/cli/cli/grid_run.py", line 340, in run
    run_obj.start()
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/grid/sdk/affirmations.py", line 47, in wrapper
    return func(self, *args, **kwargs)
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/grid/sdk/runs.py", line 701, in start
    res = create_run(
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/grid/sdk/rest/exceptions.py", line 30, in wrapper
    raise e
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/grid/sdk/rest/exceptions.py", line 22, in wrapper
    return fn(*args, **kwargs)
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/grid/sdk/rest/runs.py", line 111, in create_run
    return client.run_service_create_run(spec_cluster_id=cluster_id, body=request)
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/grid/openapi/api/run_service_api.py", line 67, in run_service_create_run
    (data) = self.run_service_create_run_with_http_info(spec_cluster_id, body, **kwargs)  # noqa: E501
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/grid/openapi/api/run_service_api.py", line 137, in run_service_create_run_with_http_info
    return self.api_client.call_api(
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/grid/openapi/api_client.py", line 333, in call_api
    return self.__call_api(resource_path, method,
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/grid/openapi/api_client.py", line 165, in __call_api
    response_data = self.request(
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/grid/openapi/api_client.py", line 375, in request
    return self.rest_client.POST(url,
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/grid/openapi/rest.py", line 276, in POST
    return self.request("POST", url,
  File "/opt/miniconda3/envs/gridai/lib/python3.8/site-packages/grid/openapi/rest.py", line 235, in request
    raise ApiException(http_resp=r)
grid.openapi.rest.ApiException: (400)
Reason: Bad Request
HTTP response headers: HTTPHeaderDict({'Access-Control-Allow-Headers': 'Content-Type,X-Grid-Key,X-Grid-User,Authorization', 'Access-Control-Allow-Methods': 'GET,POST,PUT,PATCH,DELETE,HEAD,OPTIONS', 'Access-Control-Allow-Origin': '*', 'Content-Type': 'application/json', 'Vary': 'Accept-Encoding', 'Date': 'Tue, 25 Jan 2022 20:59:45 GMT', 'Content-Length': '743', 'Via': '1.1 google', 'Alt-Svc': 'clear'})
HTTP response body: {"code":3,"message":"cannot generate experiments for run spec id:\"01ft9gk578mbsbz71360my8h37\" name:\"meek-hellman-2911\" spec:{user_id:\"c9b6b475-2ad7-4292-a4a1-cd804474b4fe\" cluster_id:\"prod-2\" desired_state:RUN_STATE_SUCCEEDED source_code:\"https://github.com/robert-s-lee/grid-julia.git#ref=386106b852a8580f9b16383a02a9e4927d56a23b\" relative_work_dir:\".\" run_controller_command:\"run.sh  --arg1 '[1,2,3]'\" instance_type:\"t2.medium\" resources:{cpu:1 storage_gb:100} scratch:{size_gb:100 mount_path:\"/tmp/scratch\"} image:{framework:\"julia\"} actions:{} sweep_type:\"random_search\"}: rpc error: code = Unknown desc = Exception calling application: Cannot execute random search with missing value for `num_trials`.","details":[]}
```

  - `--num_trials` is not valid

``` 
 grid run --framework julia --strategy random_search --num_trials 2 run.sh --arg1 "[1,2,3]"

Usage:
    grid run [OPTIONS] [RUN_COMMAND]...                                                                                                                      
                                                                                                                                                             
Try 'grid run --help' for help.

Error: Invalid value for '[RUN_COMMAND]...': --num_trials
```
