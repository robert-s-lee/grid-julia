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

- Burst to Cloud on Grid.ai
```bash
grid run --framework julia run.sh hello.jl --arg1 "[1,2,3]"
grid run --framework julia --strategy random_search --trials 2 run2.sh --arg1 "[1,2,3]"
grid run --framework julia --strategy random_search --num_trials 2 run2.sh --arg1 "[1,2,3]"
```