module Api
  module V1
    class BooksController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :not_found
      def index
        render json: Book.all
      end

      def create
        #placeholder comment
        book = Book.new(book_params)

        if book.save
          render json: book, status: 201
        else
          render json: book.errors, status: :unprocessable_entity
        end
        end

      def destroy
        Book.find(params[:id]).destroy!

        head :no_content
      end

      private
      def book_params
        params.require(:book).permit(:title, :author)
      end

    end
  end
end

