;; 6. Create a test where a `br_if` checks a counter that hasn’t been modified by preceding `nop` and confirm that WebAssembly's behavior aligns with expectations while wizard_engine may have deviations due to tracing.

(assert_invalid
  (module (func (loop (nop) (br_if 0 (i32.const 0)))))
  "label target type mismatch"
)