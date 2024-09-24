;; 10. Test an `unreachable` positioned within multiple nested conditional branches inside loops, followed by a mix of `br`, `br_if`, and `br_table` instructions targeting varying depths. Verifies that jumps and depth calculations are correctly handled, ensuring traps correctly alter the control flow.

(assert_invalid
  (module
    (func $test-unreachable-in-nested-control-flow
      loop 
        block 
          br_if 0 (i32.const 1)
          block 
            br_table 0 (i32.const 0) (unreachable)
            br 1
          )
        end
      end
    )
  )
 "invalid type"
)