;; 3. **Multiple Blocks and NOPs**: Design a function with multiple nested blocks interspersed with `nop` instructions. Check if the function returns the correct value, ensuring the correct handling of multiple nested blocks.

(assert_invalid
  (module (func (result i32)
    block (result i32)
      block
        block
          nop
        end
        nop
        i32.const 42
      end
      nop
    end
  ))
  "type mismatch"
)