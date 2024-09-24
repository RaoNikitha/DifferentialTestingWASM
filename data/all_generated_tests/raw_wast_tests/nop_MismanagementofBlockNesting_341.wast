;; 2. **Test Nop Inside Loop Block**: Develop a WebAssembly function containing a loop block with multiple `nop` instructions inside. This ensures that the presence of `nop` doesn't disrupt the loop block's flow, allowing the loop to iterate the correct number of times.

(assert_invalid
  (module
    (func (loop (nop) (br 0) (nop)))
  )
  "type mismatch"
)