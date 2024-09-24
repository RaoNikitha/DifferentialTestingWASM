;; <Test 10> Develop a WebAssembly function involving multiple `block` and `if` constructs within a larger `loop`. Inside an `if`, call a function that modifies global state. After the call, perform a `br` to exit the loop. Ensure the global state changes are properly reflected after branching out of the loop.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $modify_global (global.set $g (i32.const 1)))
    (func $test_br_instruction
      (loop $outer
        (block $inner_block
          (if (i32.const 1)
            (then
              (call $modify_global)
              (br $outer)
            )
          )
        )
      )
      (global.get $g)
    )
  )
  "type mismatch"
)