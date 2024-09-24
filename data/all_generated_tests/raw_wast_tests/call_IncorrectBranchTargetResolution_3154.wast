;; Test 3: Construct a recursive function call involving multiple depth levels and `br` instructions. Validate the function by passing in parameters that trigger deep recursion. Ensure differential behavior when the function's call or branch targets lead to incorrect returns or infinite looping.

(assert_invalid
  (module
    (type $t0 (func (param i32) (result i32)))
    (func $rec (type $t0) (param $p0 i32) (result i32)
      (if (result i32)
        (i32.eqz (local.get $p0))
        (then (i32.const 0))
        (else
          (local.get $p0)
          (br_if 0 (i32.gt_u (local.get $p0) (i32.const 1000)))
          (call $rec (i32.sub (local.get $p0) (i32.const 1)))
        )
      )
    )
  )
  "type mismatch"
)