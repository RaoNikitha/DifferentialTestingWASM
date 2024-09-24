;; Design an `if` block where the valid `br_table` exists in the `then` branch, but an edge case where the `else` branch includes indirect call indexes that lead directly to traps; test if wizard_engine handles this differently due to procedural state manipulation.

(assert_invalid
  (module
    (func $type-then-valid-br_table-else-indirect-call-trap (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (block $label (br_table 0 (i32.const 0))))
        (else
          (call_indirect (type $sig) (i32.const 1) (i32.const 0))
        )
      )
    )
    (type $sig (func (result i32)))
  )
  "type mismatch"
)