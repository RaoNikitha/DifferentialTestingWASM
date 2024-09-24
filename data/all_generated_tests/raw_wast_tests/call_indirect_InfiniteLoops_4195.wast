;; 4. **Test Description**: Develop a WebAssembly module where a `call_indirect` instructs a function containing a `loop` with `br_if` statements that depend on function parameters. Verify that the parameters passed correctly influence the loop's termination. Mismanagement in type checking or operand stacking can result in an infinite loop scenario.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $loop-test (param i32) (result i32)
      (local i32)
      (local.set 1 (local.get 0))
      (loop (result i32)
        (br_if 0 (i32.eqz (local.get 1)))
        (local.set 1 (i32.sub (local.get 1) (i32.const 1)))
        (br 1)
      )
      (local.get 1)
    )
    (elem (i32.const 0) $loop-test)
    (func $test-call (call_indirect (type 0) (i32.const 0) (i32.const 10)))
  )
  "type mismatch"
)