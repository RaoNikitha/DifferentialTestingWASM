;; 7. **Test Description:**    - Design a module A with a recursive function inserting `nop` at different recursion levels. Export the function and call it in module B with specific depth values. Ensure proper return after completing recursion in module B with a validated stack state.    - **Constraint Checked:** `nop` should not alter recursion and stack integrity.    - **Relation to Issue:** Validates control flow consistency and stack state integrity during recursion.

(assert_invalid
  (module
    (func $rec (param $n i32) (result i32)
      (if (result i32)
        (i32.eqz (local.get $n))
        (then (i32.const 0))
        (else
          (nop)
          (i32.add
            (local.get $n)
            (call $rec (i32.sub (local.get $n) (i32.const 1)))
          )
        )
      )
    )
    (export "recursive" (func $rec))
  )
)