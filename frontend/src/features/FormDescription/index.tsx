import { Heading, Text } from "@chakra-ui/react";

import "./FormDescription.css"

function FormDescription() {
    return (
        <div className="desc">
            <Heading as='h3' size='lg'>
                被験前アンケートのご回答
            </Heading>
            <Text fontSize='xl'>
                実験を開始するにあたって、被験者情報についてご入力ください。
            </Text>
        </div>
    )
}

export default FormDescription
