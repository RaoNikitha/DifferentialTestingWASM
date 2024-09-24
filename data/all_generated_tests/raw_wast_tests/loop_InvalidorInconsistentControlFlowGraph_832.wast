;; 3. Implement a loop where the sequence of instructions does not terminate correctly with 'end', resulting in an invalid CFG termination. This will test the validity of ensuring well-nested structures.

(assert_invalid
  (module (func $invalid-loop-termination
    (loop (result i32) (i32.const 0)
  ))
  "unexpected end of section or function"
)