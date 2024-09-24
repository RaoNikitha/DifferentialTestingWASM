;; 10. **Direct Type Mismatch via Immediate Encoding:**    Construct a `br_table` where label references include mixed operand types via immediate encoding, aiming to trap due to immediate target having mismatched operand types. This tests the handling of encoded immediate values regarding type consistency.

(assert_invalid
  (module
    (func
      (block (loop (block $default (br_table $default $default (i32.const 2)))))
    )
  )
  "unknown label"
)