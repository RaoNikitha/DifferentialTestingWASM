;; 10. **Test Description**: Write a scenario where conditional memory access is controlled by `br_if`. Incorrectly evaluated conditions would either skip necessary memory accesses or cause invalid memory operations, showcasing divergent outputs.

(assert_invalid
  (module
    (func $conditional-memory-access
      (param $condition i32)
      (result i32)
      (if (result i32)
        (i32.eqz (local.get $condition))
        (then
          (call 0 (i32.const 42)) 
        )
        (else
          (memory.size)
        )
      )
    )
    (func (param i32) (result i32))
    (memory 1)
  )
  "type mismatch"
)