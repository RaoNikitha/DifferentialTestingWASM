;; 4. Implement a loop that includes a series of function calls. The loop's continuation depends on a `br_if` condition that checks a value left on the stack by these function calls. Incorrect condition evaluation should visibly affect loop execution.

(assert_invalid
  (module
    (func $loop-with-call
      (local $i i32)
      (local.set $i (i32.const 10))
      (block $exit
        (loop $loop
          (call $decrement (local.get $i))
          (local.set $i (i32.sub (local.get $i) (i32.const 1)))
          (br_if $exit (i32.eqz (local.get $i)))
          (br $loop)
        )
      )
    )
    (func $decrement (param i32) (result i32)
      (local.get 0)
    )
  )
  "type mismatch"
)