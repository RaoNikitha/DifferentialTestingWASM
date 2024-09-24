;; Test 7: Build a complex loop in an exported function involving a sequence of `br_if` conditional branches that are called from another module. The focus is on the correctness of condition evaluation and branch execution in both implementations.

(assert_invalid
  (module
    (func $complex-loop (param i32) (result i32)
      (local i32)
      (loop $my_loop (result i32)
        (i32.const 1)
        (local.set 1)
        (block (br_if 0 (i32.eq (local.get 0) (local.get 1))))
        (br $my_loop)
      )
    )
    (export "complex_loop_function" (func $complex-loop))
  )
  "type mismatch"
)