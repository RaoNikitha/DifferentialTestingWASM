;; Create a loop in which the called function modifies memory, and the loop checks memory contents to decide whether to continue or exit. This tests memory consistency and the interaction between memory operations and control flow within loops.

(assert_invalid
  (module
    (memory 1)
    (func $modify (param i32)
      (i32.store (local.get 0) (i32.const 1))
    )
    (func $loop
      (loop (result i32)
        (call $modify (i32.const 0))
        (i32.load (i32.const 0))
        (i32.const 1)
        (i32.eq)
        (br_if 1)
      )
    )
  )
  "type mismatch"
)