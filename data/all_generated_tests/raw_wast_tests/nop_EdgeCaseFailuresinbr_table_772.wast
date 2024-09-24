;; 3. Design a test where multiple `nop` instructions are interlaced with `br_table` commands, each with edge-case indices (e.g., equal to the number of targets). Validate if the execution flows correctly without unexpected behaviors in both environments.

(assert_invalid
  (module
    (func $test (block $label0 (br_table $label0 $label0 (i32.const 1) (i32.const 2) (nop) (nop) (br (i32.const 0)))))
  )
  "unknown label" 
)