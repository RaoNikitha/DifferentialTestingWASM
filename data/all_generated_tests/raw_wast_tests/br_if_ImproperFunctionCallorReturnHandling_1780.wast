;; 1. **Test 1: Invalid Depth Access**: A `br_if` instruction attempts to access a label with a depth exceeding the current stack's height during a function call sequence. This tests the proper bounds checking in `wizard_engine` but can expose an issue in WASM, where such bounds might be unchecked.

(assert_invalid
  (module (func (block (block (br_if 2 (i32.const 1)))))) 
  "unknown label"
)