;; Add `nop` instructions before a `br_if` that depends on a function parameter. Test if the branch decision is based accurately on the parameter value.

(assert_invalid
  (module
    (func $test (param i32)
      (nop)
      (nop)
      (nop)
      (br_if 0 (local.get 0))
    )
  )
  "unexpected stack state"
)