;; 7. **Test Description:**    A `block` with alternating `br_if` with conditions checking greater than and less than conditions on stack values. The block includes counter updates to ensure varying condition results. Test should verify that each `br_if` correctly follows the evaluated condition.    - **Constraint:** Checks correct branching based on alternating conditional evaluations.

(assert_invalid
  (module
    (func $test-block-with-alternating-br_if
      (block $outer (result i32)
        (local i32)
        (local.set 0 (i32.const 0))
        (loop $inner
          (local.set 0 (i32.add (local.get 0) (i32.const 1)))
          (br_if $outer (i32.gt_s (local.get 0) (i32.const 4)))
          (br_if $inner (i32.lt_s (local.get 0) (i32.const 2)))
        )
        (i32.const 10)
      )
    )
  )
  "type mismatch"
)