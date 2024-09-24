;; 2. **Test Description**: Construct a test with nested loops, where `call_indirect` is used in the inner loop, and the outer loop contains a `br_if` condition that relies on state modified by the inner loop's `call_indirect`.     - **Constraint Being Checked**: Correct nested loop handling and inter-loop variable dependency resolution.    - **Relation to Infinite Loops**: Failure to correctly update state across loops due to stack mismanagement causing an infinite loop in the outer loop.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32 i32) (result i32)))
    (func $add (param i32 i32) (result i32)
      local.get 0
      local.get 1
      i32.add
    )
    (table 1 funcref)
    (elem (i32.const 0) $add)
    (func $test
      (local $x i32)
      (local.set $x (i32.const 0))
      loop $outer
        (br_if $outer
          (block $inner
            (block $match
              local.get $x
              i32.const 10
              i32.ge_s
              br_if $match
              local.set $x
                (call_indirect (type 0) (i32.const 0) local.get $x (i32.const 1))
              br $inner
            )
            (local.set $x (i32.const 5))
          )
        )
      end
    )
  )
  "type mismatch"
)