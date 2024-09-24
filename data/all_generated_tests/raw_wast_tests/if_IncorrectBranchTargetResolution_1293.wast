;; 4. **Test for Deeply Nested `if-else` Complications**:    Construct a chain of `if-else` statements nested deeply. Include `br` instructions intended to jump to specific layers. Verify the depth affects resolution accuracy.    - **Constraint**: Verify label resolution does not lose track amidst multiple nested layers.    - **Expectation**: Correct jumps to intended layers when issuing a `br`.

(assert_invalid
  (module
    (func $nested_if_else
      (param $p1 i32)
      (param $p2 i32)
      (param $p3 i32)
      (result i32)
      (local $l1 i32)
      (local $l2 i32)
      
      (if (result i32) 
        (local.get $p1)
        (then
          (if (result i32)
            (local.get $p2)
            (then 
              (if (result i32)
                (local.get $p3)
                (then 
                  (local.set $l1 (i32.const 1))
                )
                (else 
                  (br 1))
              )
            )
            (else
              (local.set $l1 (i32.const 2)))
          )
        )
        (else
          (local.set $l1 (i32.const 3))
        )
      )
      (local.get $l1)
    )
  )
  "type mismatch"
)