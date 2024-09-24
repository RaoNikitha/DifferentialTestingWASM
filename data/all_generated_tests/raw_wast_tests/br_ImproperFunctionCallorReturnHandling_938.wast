;; <Test 9> Design a WebAssembly function with nested `loops` and `block` structures. Use `call` to invoke a function within the inner loop. After the `call`, place a `br` to the outermost block. Validate if the inner function call state is cleared and execution resumes correctly after the outer loop’s branch.

(assert_invalid
  (module
    (func $inner (result i32)
      (i32.const 99)
    )
    (func $test
      (block $blk_outer
        (loop $loop_outer
          (block $blk_inner
            (loop $loop_inner
              (call $inner)
              (br $blk_outer)
            )
          )
        )
      )
    )
  )
  "invalid branch target"
)