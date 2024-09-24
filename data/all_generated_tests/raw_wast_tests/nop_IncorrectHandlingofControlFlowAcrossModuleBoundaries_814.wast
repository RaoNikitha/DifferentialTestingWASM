;; 5. **Test Description**: Create a WebAssembly module that exports a function containing `nop` instructions followed by a series of branching instructions (e.g., `br_if`, `br_table`). Import and call this function from another module and check that `nop` instructions do not disrupt branching or stack integrity across module boundaries.

(assert_invalid
  (module
    (type $return_block (func (result i32)))
    (func $test
      (block $label1
        (nop)
        (br_table $label1 $label1 (i32.const 0))
        (nop))
      (block $label2
        (nop)
        (br_if $label2 (i32.const 1))
        (nop))))
  "type mismatch"
)