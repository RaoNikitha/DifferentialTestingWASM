;; 1. **Test 1: Unreachable in Block with Mismatched Signature**    - A `block` instruction with an expected result type that does not match the values pushed onto the stack due to an `unreachable` instruction. This test checks if the environment correctly interprets the stack type within blocks containing `unreachable`.    - **Constraint Checked:** Ensures the stack polymorphism of `unreachable` correctly interacts with the expected block signature.

(assert_invalid
 (module (func (result i32)
   (block (result i32)
     (unreachable)
     (i32.const 0)
   )
 ))
 "type mismatch"
)