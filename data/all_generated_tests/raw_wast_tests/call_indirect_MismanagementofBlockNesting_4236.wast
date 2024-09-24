;; 5. **Test 5**: `br_table` with `call_indirect`:    - Implement `br_table` instructions to jump to different nested block levels.    - Place `call_indirect` at some of these block levels.    - Validate that the `call_indirect` respects the intended block exits and does not cause unintended traps.

(assert_invalid
  (module
    (type (func (param i32 i32) (result i32)))
    (table 1 funcref)
    (func $br_table_call_indirect
      (block
        (block
          (block
            (br_table 0 2 1 (i32.const 1))
            (call_indirect (type 0) (local.get 0) (local.get 1))
          )
          (call_indirect (type 0) (local.get 0) (local.get 1))
        )
        (call_indirect (type 0) (local.get 0) (local.get 1))
      )
    )
    (elem (i32.const 0) funcref (ref.func $target_func))
    (func $target_func (param i32 i32) (result i32) (i32.add (local.get 0) (local.get 1)))
  )
  "type mismatch"
)