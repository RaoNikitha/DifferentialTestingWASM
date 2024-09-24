;; 2. **Misaligned Return after Br in Function:**    Inside a function, place a `br` instruction targeting multiple levels up in nested blocks, then ensure the function properly returns to its caller. This checks if a `br` properly unwinds to the correct block and maintains the correct function call return behavior.

(assert_invalid (module (func $misaligned-return-after-br-in-function (block (block (block (br 2))) (return)))) "type mismatch")