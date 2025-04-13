
# 8-Week Lua Learning Curriculum for Redis Scripting

## Week 1: Lua Fundamentals Reinforcement
**Goal**: Solidify Lua basics and understand Lua's approach to data structures

### Day 1-2: Review & Deepen Core Concepts
- **Study**: Lua types, variables, and scope differences from Go
- **Practice**: Write utility functions that manipulate strings and numbers
- **Resources**: Programming in Lua (PIL) chapters 1-4

### Day 3-4: Tables Deep Dive
- **Study**: Table construction, access patterns, array vs. dictionary usage
- **Practice**: Convert a Go struct/slice structure to Lua tables
- **Resources**: PIL chapter 5, 11

### Day 5-7: Functions & Closures
- **Study**: First-class functions, closures, and upvalues
- **Practice**: Implement higher-order functions (map, filter, reduce)
- **Mini-Project**: Create a simple event system with callbacks

## Week 2: Advanced Lua Features
**Goal**: Master Lua's unique programming concepts

### Day 1-2: Metatables & Metamethods
- **Study**: Understanding Lua's object-oriented capabilities
- **Practice**: Create a "class" system with metatables
- **Resources**: PIL chapters 13, 16

### Day 3-4: Coroutines
- **Study**: Coroutines for cooperative multitasking
- **Practice**: Implement a simple state machine
- **Resources**: PIL chapter 9

### Day 5-7: Error Handling & Module System
- **Study**: Error handling patterns, creating/using modules
- **Practice**: Create a reusable utility module
- **Mini-Project**: Build a configuration loader using Lua files

## Week 3: Redis Fundamentals & Lua Introduction
**Goal**: Connect Lua knowledge to Redis architecture

### Day 1-2: Redis Data Structures
- **Study**: Redis core types (strings, lists, sets, hashes, etc.)
- **Practice**: Implement basic Redis operations from CLI
- **Resources**: Redis documentation

### Day 3-4: Redis Lua Integration
- **Study**: Redis Lua scripting environment, limitations
- **Practice**: Run simple Lua scripts in Redis
- **Resources**: Redis scripting documentation

### Day 5-7: EVAL & EVALSHA Commands
- **Study**: Script execution, caching, and atomicity
- **Practice**: Load and execute Lua scripts in Redis
- **Mini-Project**: Implement a counter with expiration in Lua

## Week 4: Redis Lua Scripting Patterns
**Goal**: Apply Lua effectively within Redis constraints

### Day 1-2: redis.call() and redis.pcall()
- **Study**: Command execution and error handling
- **Practice**: Write scripts with error recovery
- **Resources**: Redis Lua API documentation

### Day 3-4: Script Atomicity
- **Study**: MULTI/EXEC vs Lua scripts, benefits and limitations
- **Practice**: Convert a MULTI/EXEC block to a Lua script
- **Resources**: Redis transactions documentation

### Day 5-7: Keys & Arguments
- **Study**: Passing data to scripts, KEYS vs ARGV
- **Practice**: Parameterize scripts for reuse
- **Mini-Project**: Implement a rate limiter with configurable window

## Week 5: Advanced Redis Scripting
**Goal**: Build complex, production-ready scripts

### Day 1-2: Performance Optimization
- **Study**: Memory usage, time complexity, benchmarking
- **Practice**: Optimize an existing script
- **Resources**: Redis performance documentation

### Day 3-4: Script Loading & Management
- **Study**: Script deployment strategies, SCRIPT LOAD
- **Practice**: Create a script management system
- **Resources**: Redis scripting administration

### Day 5-7: Debugging Techniques
- **Study**: Debugging strategies for Redis scripts
- **Practice**: Add logging to complex scripts
- **Mini-Project**: Create a debug wrapper for script development

## Week 6: Redis Data Structures with Lua
**Goal**: Master manipulation of complex Redis data structures

### Day 1-2: Working with Lists & Sets
- **Study**: Efficient list/set operations in Lua
- **Practice**: Implement custom list operations
- **Resources**: Redis data types documentation

### Day 3-4: Hash & Sorted Set Manipulation
- **Study**: Advanced sorted set scoring and ranking
- **Practice**: Create leaderboard functionality
- **Resources**: Redis sorted set documentation

### Day 5-7: Data Modeling with Lua
- **Study**: Representing complex data models in Redis
- **Practice**: Design a schema for a real-world object
- **Mini-Project**: User session management system

## Week 7: Practical Redis Scripting Patterns
**Goal**: Implement common Redis scripting use cases

### Day 1-2: Distributed Locks
- **Study**: Lock acquisition, release, and replication concerns
- **Practice**: Implement Redlock algorithm in Lua
- **Resources**: Redlock specification

### Day 3-4: Pipelines & Batching
- **Study**: Efficient batch processing techniques
- **Practice**: Implement bulk operations
- **Resources**: Redis pipelining documentation

### Day 5-7: Time Series Data
- **Study**: Storing and querying time series data
- **Practice**: Implement downsampling in Lua
- **Mini-Project**: Create a metrics collection and aggregation system

## Week 8: Production-Ready Redis Lua Integration
**Goal**: Prepare for real-world implementation

### Day 1-2: Script Versioning & Deployment
- **Study**: Managing script updates in production
- **Practice**: Create a script deployment workflow
- **Resources**: Redis administration documentation

### Day 3-4: Testing Strategies
- **Study**: Unit testing Redis scripts
- **Practice**: Write tests for existing scripts
- **Resources**: Redis mock libraries

### Day 5-7: Final Project
- **Goal**: Combine all learned concepts
- **Project Options**:
  1. A rate-limiting API with different throttling strategies
  2. A job queue processor with priority and scheduling
  3. A caching layer with automatic invalidation

## Learning Resources
- [Programming in Lua](https://www.lua.org/pil/)
- [Redis Documentation](https://redis.io/docs/)
- [Redis University](https://university.redis.com/)
- [Redis in Action](https://redislabs.com/redis-in-action/)
- [OpenResty Lua Guide](https://github.com/openresty/lua-nginx-module#readme)
