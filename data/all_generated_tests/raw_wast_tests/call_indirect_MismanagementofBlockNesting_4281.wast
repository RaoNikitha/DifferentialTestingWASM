;; 10. **Infinite loop containment with invalid call_indirect escaping nested blocks**:    - **Description**: Create an infinite loop structure with hidden invalid `call_indirect` instructions nested deep inside blocks that should trap without failing due to loop containment.    - **Expected outcome**: Check that both engines handle infinite loop containment correctly by triggering traps as soon as the invalid indirect call is reached, regardless of loop nesting.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (func $callee (param i32))
    (table funcref (elem $callee))
    (func
      (loop
        (block
          (block
            (call_indirect (type $sig) (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)