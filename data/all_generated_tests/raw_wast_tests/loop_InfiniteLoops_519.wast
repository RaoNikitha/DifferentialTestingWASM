;; 10. Use a `loop` with an invalid backward branching in `br_table`, ensuring branching to a non-existent entry. Validate if `WebAssembly` triggers an error response while `wizard_engine` mishandles and leads to an infinite loop by not catching the invalid branch.

(assert_invalid
  (module (func (loop (br_table 0 1 (i32.const 0)))))
  "invalid table index"
)