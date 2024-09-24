;; 9. Test Description: Create a loop structure with alternating `br` and `br_if` instructions targeting different label depths, while actively managing stack values. The aim is to identify stack anomalies caused by mishandled branch conditions and check how each implementation deals with complex stack states.

(assert_invalid
  (module (func $complex-loop
    (loop (result i32)
      (i32.const 1)
      (br_if 0 (i32.const 1))
      (i32.const 2)
      (br 1)
    )
  ))
  "type mismatch"
)