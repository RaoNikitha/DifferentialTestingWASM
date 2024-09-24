;; 5. **Test with 'br_table' Self-Referencing via Call**:    - Validate the scenario where 'br_table' indirectly leads to itself through a function call (creating a looping call sequence).    - Setup 'br_table' with one branch invoking a function which eventually redirects back to the same 'br_table'.    - This checks for any infinite loop or recursion issues caused by 'br_table' branching via a function call.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $loop (param i32)
      (call_indirect (type 0) (local.get 0))
      (br_table 0 (local.get 0))
    )
    (elem (i32.const 0) $loop)
  )
  "indirect call leading to infinite recursion"
)