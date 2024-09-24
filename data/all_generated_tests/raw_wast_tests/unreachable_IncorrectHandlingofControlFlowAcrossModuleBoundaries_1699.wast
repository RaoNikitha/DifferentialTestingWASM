;; 10. **Parallel Module Imports with Coordinated `unreachable` Traps:**    - Create tests involving two parallel modules importing different functions from a third module. Each imported function contains `unreachable` at different points within nested blocks.    - **Constraint:** Ensures that the trap behavior is consistent and independent across different importing modules, coordinating correct handling of traps across module boundaries.

(assert_invalid
  (module
    (import "mod" "func_a" (func $func_a (result i32)))
    (import "mod" "func_b" (func $func_b (result i32)))
    (func $parallel_modules_with_unreachable_trap
      (block
        (call $func_a)
        (unreachable)
        (call $func_b)
        (unreachable)
      )
    )
  )
  "type mismatch"
)