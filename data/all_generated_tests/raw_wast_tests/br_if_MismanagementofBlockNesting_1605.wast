;; 6. **Test 6**: Integrate multiple nested `if` and `block` structures where `br_if` targets an intermediate block depending on a runtime condition. This test verifies that intermediate levels within nested structures are appropriately managed and the correct block is referenced.

(assert_invalid
 (module
   (func (result i32)
     (block
       (if (i32.eqz (i32.const 1))
         (block
           (i32.const 1)
           (if (result i32)
             (then (i32.const 2) (br_if 1 (i32.const 1)))
             (else (i32.const 3) (br_if 0 (i32.const 0)))
           )
         )
         (block
           (i32.const 4)
           (if (result i32)
             (then (i32.const 5) (br_if 2 (i32.const 1)))
             (else (i32.const 6) (br_if 1 (i32.const 0)))
           )
         )
       )
     )
     (i32.const 7)
   )
 )
 "type mismatch"
)